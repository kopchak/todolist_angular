require "rails_helper"

describe "Manage task", js: true do
  before do
    user = create(:user)
    sign_in(user)
    @project = create(:project, user: user)
    @task = create(:task, project: @project)
    visit '/#/projects'
  end

  scenario "User creates new task" do
    task_title = Faker::Lorem.word
    fill_in('Start typing here to create a task...', with: task_title)
    click_button("Add task")
    expect(page).to have_content("Task was created")
  end

  scenario "User updates task" do
    find('.task_block').hover
    find('.edit_task_img').click
    find('.edit_task').fill_in("Set new title...", with: 'new title')
    click_button("Change")
    expect(page).to have_content("new title")
    expect(page).to have_content("Task was updated")
  end

  scenario "User delete task" do
    find('.task_block').hover
    find('.del_task_img').click
    expect(page).to have_content("Task was deleted")
  end
end
