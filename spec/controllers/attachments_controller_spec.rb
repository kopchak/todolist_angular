require 'rails_helper'

RSpec.describe AttachmentsController, type: :controller do
  before do
    @user = create(:user)
    @project = create(:project, user: @user)
    @task = create(:task, project: @project)
    @comment = create(:comment, task: @task)
    sign_in @user
    redefine_cancan_abilities
  end

  describe "POST#create" do
    context 'check cancan' do
      before do
        @ability.cannot :manage, Attachment
      end

      it 'return forbidden' do
        post :create, format: :json, comment_id: @comment.id
        expect(response).to be_forbidden
      end
    end

    context 'with valid params' do
      it 'creates attachment' do
        new_attachment = attributes_for(:attachment)
        expect { post :create, format: :json, comment_id: @comment.id, file: new_attachment[:file]}.
          to change(Attachment, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'doesnt create attachment' do
        expect { post :create, format: :json, comment_id: @comment.id, file: ''}.
          to_not change(Attachment, :count)
      end
    end
  end

  describe "DELETE#destroy" do
    before do
      @attachment = create(:attachment, comment: @comment)
    end

    context 'check cancan' do
      before do
        @ability.cannot :manage, Attachment
      end

      it 'return forbidden' do
        delete :destroy, format: :json, comment_id: @comment.id, id: @attachment.id
        expect(response).to be_forbidden
      end
    end

    it 'delete attachment' do
      expect { delete :destroy, format: :json, comment_id: @comment.id, id: @attachment.id }.
        to change(Attachment, :count).by(-1)
    end
  end
end
