require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before do
    @user = create(:user)
    @project = create(:project, user: @user)
    sign_in @user
    redefine_cancan_abilities
  end

  describe "POST#create" do
    context 'check cancan' do
      before do
        @ability.cannot :manage, Task
      end

      it 'return forbidden' do
        post :create, format: :json, project_id: @project.id
        expect(response).to be_forbidden
      end
    end

    context 'with valid params' do
      it 'creates task' do
        new_task = attributes_for(:task)
        expect { post :create, format: :json,
          project_id: @project.id, title: new_task[:title], deadline: new_task[:deadline]}.
          to change(Task, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'doesnt create task' do
        expect { post :create, format: :json, project_id: @project.id, title: '', deadline: ''}.
          to_not change(Task, :count)
      end
    end
  end

  describe "PATCH#update" do
    before do
      @task = create(:task, project: @project)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Task
      end

      it 'return forbidden' do
        patch :update, format: :json, project_id: @project.id, id: @task.id
        expect(response).to be_forbidden
      end
    end

    context 'with valid params' do
      it 'updates task' do
        new_task = attributes_for(:task)
        patch :update, format: :json, project_id: @project.id,
              id: @task.id, title: new_task[:title], deadline: new_task[:deadline]
        expect(@task.reload.title).to eq(new_task[:title])
      end
    end

    context 'with invalid params' do
      it 'doesnt update task' do
        patch :update, format: :json, project_id: @project.id,
          id: @task.id, title: '', deadline: ''
        expect(@task.title).to eq(@task.reload.title)
        expect(@task.deadline).to eq(@task.reload.deadline)
      end
    end
  end

  describe "DELETE#destroy" do
    before do
      @task = create(:task, project: @project)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Task
      end

      it 'return forbidden' do
        delete :destroy, format: :json, project_id: @project.id, id: @task.id
        expect(response).to be_forbidden
      end
    end

    it 'delete task' do
      expect { delete :destroy, format: :json, project_id: @project.id, id: @task.id }.
        to change(Task, :count).by(-1)
    end
  end
end
