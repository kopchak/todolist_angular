require "rails_helper"

describe "Manage comment", js: true do
  before do
    user = create(:user)
    sign_in(user)
    @project = create(:project, user: user)
    @task = create(:task, project: @project)
    @comment = create(:comment, task: @task)
    visit '/#/projects'
  end

  scenario "User creates new comment" do
    comment_title = Faker::Lorem.word
    find('.task_title').click
    fill_in('New comment', with: comment_title)
    click_button("Add comment")
    expect(page).to have_content("Comment was created")
  end

  scenario "User delete comment" do
    find('.task_title').click
    find('.close').click
    expect(page).to have_content("Comment was deleted")
  end
end
