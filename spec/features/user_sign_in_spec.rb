require "rails_helper"

feature "the signin process" do
  scenario 'Registered user tries to sign in', js: true do
    @user = create(:user)
    visit '/#/sign_in'
    fill_in 'email',    with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successful')
  end

  scenario 'Non-registered user tries to sign in', js: true do
    visit '/#/sign_in'
    fill_in 'email',    with: Faker::Internet.safe_email
    fill_in 'password', with: Faker::Internet.password
    click_button 'Sign in'
    expect(page).to have_content('Invalid credentials')
  end
end
