require 'rails_helper'

RSpec.describe 'Group index page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'name',
      email: 'user@test3.com',
      password: 'password',
      confirmed_at: Time.now
    )

    # add groups
    @groups = []
    2.times do |x|
      group = Group.new(name: "Test Group #{x}", user: @user)
      group.icon.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'dominos.png')),
        filename: 'dominos.png',
        content_type: 'image/png'
      )
      group.save
      Purchase.create(name: "test purchase #{x}", amount: 100, author: @user, group:)
      Purchase.create(name: "test purchase #{x}", amount: 50, author: @user, group:)
      @groups << group
    end

    visit user_session_path

    fill_in 'Email', with: 'user@test3.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit groups_path
  end

  it 'should display the create New category link' do
    expect(page).to have_link('New')
  end

  it 'Should display all the groups' do
    2.times { |x| expect(page).to have_content("Test Group #{x}") }
  end

  it 'Should display all groups totals' do
    expect(page).to have_content('150.00', count: 2)
  end

  scenario 'When user clicks on New link, they should be redirected to the new group page' do
    click_link('New')
    expect(page).to have_current_path(new_group_path)
  end

  scenario 'When user clicks on a group, they are taken to the group page' do
    click_link('Test Group 0')
    expect(page).to have_current_path(group_path(@groups[0]))
  end
end
