require "rails_helper"

describe "Manage comment", js: true do
  before do
    user = create(:user)
    project = create(:project, user: user)
    task = create(:task, project: project)
    comment = create(:comment, task: task)
    file = create(:attachment, comment: comment)
    sign_in(user)
    visit '/#/projects'
  end

  #  scenario "User creates new comment with file" do
  #   find('.task_title').click
  #   byebug
  #   # fill_in('New comment', with: Faker::Lorem.word)
  #   # find('.add_comment').click_button('Attach file')

  #   # attach_file('attachment', "#{Rails.root}/spec/fixtures/files/image.png")
  #   # page.attach_file('attachment', "#{Rails.root}/spec/fixtures/files/image.png")
  #   # click_on('attachment')
  #   # attach_file('Attach file', "#{Rails.root}/spec/fixtures/files/image.png")
  #   # sleep 5
  #   # click_button('Add comment')
  #   # expect(page).to have_content("image.png")
  #   # expect(page).to have_content("Comment was created")
  # end

  scenario "User remove file from comment" do
    find('.task_title').click
    # byebug
    find('.delete_attachment').click
    expect(page).to have_content("Attached file was deleted")
  end

end
