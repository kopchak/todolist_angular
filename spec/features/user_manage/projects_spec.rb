require "rails_helper"

describe "Manage project", js: true do
  before do
    user = create(:user)
    sign_in(user)
    @project = create(:project, user: user)
    visit '/#/projects'
  end

  scenario "User creates new project" do
    project_title = Faker::Name.title
    click_button("Add ToDo List")
    fill_in('Add a new todo list', with: project_title)
    click_button("Add")
    expect(page).to have_content("Todo list was created")
  end

  scenario "User updates project" do
    find('.project_block').hover
    find('.edit_project_img').click
    find('.edit_project').fill_in("Set new title", with: 'new title')
    click_button("Change")
    expect(page).to have_content("new title")
    expect(page).to have_content("Todo list was updated")
  end

  scenario "User delete project" do
    find('.project_block').hover
    find('.del_project_img').click
    expect(page).to have_content("Todo list was deleted")
  end
end
