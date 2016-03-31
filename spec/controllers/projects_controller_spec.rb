require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before do
    @user = create(:user)
    sign_in @user
    redefine_cancan_abilities
    allow(controller).to receive(:current_user).and_return(@user)
  end

  describe "GET#index" do
    before do
      @projects = create_list(:project, 3, user: @user)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Project
      end

      it 'return forbidden' do
        get :index, format: :json
        expect(response).to be_forbidden
      end
    end

    it 'return success' do
      get :index, format: :json
      expect(response).to be_success
    end

    it 'assigns @projects' do
      get :index, format: :json
      expect(assigns(:projects)).to match_array @projects
    end
  end

  describe "POST#create" do
    context 'check cancan' do
      before do
        @ability.cannot :manage, Project
      end

      it 'return forbidden' do
        post :create, format: :json
        expect(response).to be_forbidden
      end
    end

    context 'with valid params' do
      it 'creates project' do
        expect { post :create, format: :json, title: Faker::Name.title }.
          to change(Project, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'doesnt create project' do
        expect { post :create, format: :json, title: '' }.
          to_not change(Project, :count)
      end
    end
  end

  describe "PATCH#update" do
    before do
      @project = create(:project, user: @user)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Project
      end

      it 'return forbidden' do
        patch :update, format: :json, id: @project.id
        expect(response).to be_forbidden
      end
    end

    context 'with valid params' do
      it 'updates project' do
        new_title = Faker::Name.title
        patch :update, format: :json, id: @project.id, title: new_title
        expect(@project.reload.title).to eq(new_title)
      end
    end

    context 'with invalid params' do
      it 'doesnt update project' do
        patch :update, format: :json, id: @project.id, title: ''
        expect(@project.title).to eq(@project.reload.title)
      end
    end
  end

  describe "DELETE#destroy" do
    before do
      @project = create(:project, user: @user)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Project
      end

      it 'return forbidden' do
        delete :destroy, format: :json, id: @project.id
        expect(response).to be_forbidden
      end
    end

    it 'delete project' do
      expect { delete :destroy, format: :json, id: @project.id }.
        to change(Project, :count).by(-1)
    end
  end
end
