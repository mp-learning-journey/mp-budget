require 'rails_helper'

describe 'Group new page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'name',
      email: 'user@test.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit user_session_path

    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit new_group_path
  end

  it 'Should display the Save button' do
    expect(page).to have_button('Save')
  end

  scenario 'When user clicks on save button it should create a new group' do
    fill_in 'name', with: 'Test Group'
    attach_file 'group_icon', Rails.root.join('spec', 'fixtures', 'files', 'dominos.png')
    click_button 'Save'

    expect(page).to have_current_path(authenticated_root_path)
  end
end