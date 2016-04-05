require "rails_helper"

describe "Manage attachment", js: true do
  before do
    @user = create(:user)
    @project = create(:project, user: @user)
    @task = create(:task, project: @project)
    comment = create(:comment, task: @task)
    @file = create(:attachment, comment: comment)
    sign_in(@user)
  end

   scenario "User creates new comment with file" do
    find('.task_title').click
    fill_in('New comment', with: Faker::Lorem.word)
    attach_file('attachment', "#{Rails.root}/spec/fixtures/files/image.png")
    click_button('Add comment')
    expect(page).to have_link("image.png")
    expect(page).to have_content("Comment was created")
  end

  scenario "User remove file from comment", js: true do
    find('.task_title').click
    find('.delete_attachment').click
    expect(page).to have_content("Attached file was deleted")
  end
end
