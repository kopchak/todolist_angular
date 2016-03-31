require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = create(:user)
    @project = create(:project, user: @user)
    @task = create(:task, project: @project)
    sign_in @user
    redefine_cancan_abilities
  end

  describe "POST#create" do
    context 'check cancan' do
      before do
        @ability.cannot :manage, Comment
      end

      it 'return forbidden' do
        post :create, format: :json, task_id: @task.id
        expect(response).to be_forbidden
      end
    end

    context 'with valid params' do
      it 'creates comment' do
        new_comment = attributes_for(:comment)
        expect { post :create, format: :json, task_id: @task.id, text: new_comment[:text]}.
          to change(Comment, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'doesnt create comment' do
        expect { post :create, format: :json, task_id: @task.id, text: ''}.
          to_not change(Comment, :count)
      end
    end
  end

  describe "DELETE#destroy" do
    before do
      @comment = create(:comment, task: @task)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Comment
      end

      it 'return forbidden' do
        delete :destroy, format: :json, task_id: @task.id, id: @comment.id
        expect(response).to be_forbidden
      end
    end

    it 'delete comment' do
      expect { delete :destroy, format: :json, task_id: @task.id, id: @comment.id }.
        to change(Comment, :count).by(-1)
    end
  end
end
