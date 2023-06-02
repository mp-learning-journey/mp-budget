require 'rails_helper'

describe 'Purchase new page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'name',
      email: 'user@test11.com',
      password: 'password',
      confirmed_at: Time.now
    )

    # add groups
    @groups = []
    2.times do |x|
      group = Group.create(name: "Test Group #{x}", user: @user)
      group.icon.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'dominos.png')),
        filename: 'dominos.png',
        content_type: 'image/png'
      )
      group.save
      @groups << group
    end

    visit user_session_path

    fill_in 'Email', with: 'user@test11.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit new_group_purchase_path(@groups[0])
  end

  it 'Should display the Save button' do
    expect(page).to have_button('Save')
  end

  scenario 'When user clicks on save button it should create a new purchase' do
    fill_in 'name', with: 'Test Purchase'
    fill_in 'amount', with: 100
    select 'Test Group 0', from: 'group'
    click_button 'Save'

    expect(page).to have_current_path(group_path(@groups[0]))
  end
end
