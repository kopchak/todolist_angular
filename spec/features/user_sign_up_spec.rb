require "rails_helper"

feature "the signup process" do
  scenario 'with valid data ', js: true do
    visit '/#/sign_up'
    fill_in 'email',    with: Faker::Internet.safe_email
    fill_in 'password', with: Faker::Internet.password
    click_button 'Register'
    expect(page).to have_content('Registration success Welcome!')
  end

  scenario 'with invalid data ', js: true do
    visit '/#/sign_up'
    fill_in 'email',    with: 'ololo'
    fill_in 'password', with: 'ololo'
    click_button 'Register'
    expect(page).to have_content('Register')
  end
end

