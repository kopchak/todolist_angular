require "rails_helper"

feature "Manage comment" do
  before do
    @user = create(:user)
    sign_in(@user)
    @project = create(:project, user: @user)
    @task = create(:task, project: @project)
    comment = create(:comment, task: @task)
    @file = create(:attachment, comment: comment)
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

  scenario "User remove file from comment", js: true do
    find('.task_title').click
    find('.delete_attachment').click
    expect(page).to have_content("Attached file was deleted")
  end

end
