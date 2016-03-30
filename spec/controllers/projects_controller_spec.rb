require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before do
    @user = create(:user)
  end

  describe "GET#index" do
    context 'when user has been sign_in' do
      it 'get 200' do
        sign_in @user
        redefine_cancan_abilities
        allow(controller).to receive(:current_user).and_return(@user)
        get :index, format: :json
        expect(response.status).to eq(200)
      end
    end

    context 'when user not sign_in' do
      it 'redirect to sign in page' do
        get :index, format: :json
        expect(response).to redirect_to(root_path)
      end
    end

    # context 'when no have rights, cancan redirect to root path' do
    #   before do
    #     redefine_cancan_abilities
    #     sign_in @user
    #     @ability.cannot :manage, Project
    #   end

    #   it 'redirect to root' do
    #     get :index
    #     expect(response).to redirect_to(root_path)
    #   end
    # end
  end

  describe "POST#create" do
  end

  describe "PATCH#update" do
  end

  describe "DELETE#destroy" do
  end
end
