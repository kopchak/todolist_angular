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

  #  scenario "User creates new comment with file" do
  #   comment_title = Faker::Lorem.word
  #   find('.task_title').click
  #   fill_in('New comment', with: comment_title)
  #   # find('.add_comment').attach_file('attachments', "#{Rails.root}/spec/fixtures/files/image.png")
  #   # click_button('Attach file')
  #   # click_button('Attach file').attach_file('files', "#{Rails.root}/spec/fixtures/files/image.png")
  #   # find('.add_comment').attach_file('attachments', "#{Rails.root}/spec/fixtures/files/image.png")
  #   # expect(page).to have_content("image.png")
  #   expect(page).to have_content("Comment was created")
  # end

  scenario "User delete comment" do
    find('.task_title').click
    find('.close').click
    expect(page).to have_content("Comment was deleted")
  end
end
