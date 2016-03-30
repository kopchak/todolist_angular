require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it { is_expected.to belong_to(:comment) }
  it { is_expected.to validate_presence_of(:file) }
end
