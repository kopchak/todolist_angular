require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do

  describe 'abilities of guest' do
    let(:user) { nil }
    let(:ability) { Ability.new(user) }

    context 'cannot' do
      it { expect(ability).not_to be_able_to(:manage, Project) }
      it { expect(ability).not_to be_able_to(:manage, Task) }
      it { expect(ability).not_to be_able_to(:manage, Comment) }
      it { expect(ability).not_to be_able_to(:manage, Attachment) }
    end
  end

  describe 'abilities of user' do
    let(:user) { create(:user) }
    let(:ability) { Ability.new(user) }

    context 'can' do
      it { expect(ability).to be_able_to(:manage, Project) }
      it { expect(ability).to be_able_to(:manage, Task) }
      it { expect(ability).to be_able_to(:manage, Comment) }
      it { expect(ability).to be_able_to(:manage, Attachment) }

      context 'manage your' do
        let(:project) { create(:project, user: user) }
        let(:task) { create(:task, project: project) }
        let(:comment) { create(:comment, task: task) }
        let(:attachment) { create(:attachment, comment: comment) }

        it { expect(ability).to be_able_to(:manage, project) }
        it { expect(ability).to be_able_to(:manage, task) }
        it { expect(ability).to be_able_to(:manage, comment) }
        it { expect(ability).to be_able_to(:manage, attachment) }
      end
    end

    context 'cannot manage others' do
      let(:project) { create(:project) }
      let(:task) { create(:task) }
      let(:comment) { create(:comment) }
      let(:attachment) { create(:attachment) }
      
      it { expect(ability).not_to be_able_to(:manage, project) }
      it { expect(ability).not_to be_able_to(:manage, task) }
      it { expect(ability).not_to be_able_to(:manage, comment) }
      it { expect(ability).not_to be_able_to(:manage, attachment) }
    end
  end

end
