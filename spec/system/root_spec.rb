require 'rails_helper'

RSpec.describe 'Root index page', type: :feature do
  describe 'User is logged in' do
    before(:each) do
      @user = User.create(
        name: 'name',
        email: 'user@test90.com',
        password: 'password',
        confirmed_at: Time.now
      )

      visit user_session_path

      fill_in 'Email', with: 'user@test90.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      visit authenticated_root_path
    end

    it 'Should display the Logout link' do
      expect(page).to have_button('Logout')
    end

    scenario 'When user clicks on Logout link, they are taken to the login page' do
      click_button('Logout')

      expect(page).to have_current_path(unauthenticated_root_path)
    end
  end

  describe 'user is not logged in' do
    before(:each) do
      visit unauthenticated_root_path
    end
    it 'Should display the Login link' do
      expect(page).to have_link('Sign In')
    end

    it 'Should display the Sign Up link' do
      expect(page).to have_link('Sign Up')
    end

    it 'When user clicks on Login link, they are taken to the login page' do
      click_link('Sign In')

      expect(page).to have_current_path(new_user_session_path)
    end

    it 'When user clicks on Sign Up link, they are taken to the sign up page' do
      click_link('Sign Up')

      expect(page).to have_current_path(new_user_registration_path)
    end

    scenario 'Should redirect to login page if user is not logged in' do
      visit groups_path
      expect(page.current_path).to eq(new_user_session_path)
    end
  end
end
