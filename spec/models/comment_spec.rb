require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:task) }
  it { is_expected.to have_many(:attachments) }
  it { is_expected.to validate_presence_of(:text) }

  describe 'attachments' do
    before do
      @comment = create(:comment)
    end

    it 'should have multiple attachments' do
      expect { 
        @comment.attachments.create(
          file: File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
          ) 
        }.to change(@comment.attachments, :count).by(1)
    end
  end
end
