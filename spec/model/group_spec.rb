require 'rails_helper'

RSpec.describe(Group, type: :model) do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test@gmail.com', password: '123456')
    @group = Group.new(name: 'Test Group', user_id: @user.id)
    @group.icon.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'dominos.png')),
      filename: 'dominos.png',
      content_type: 'image/png'
    )
  end

  describe 'association' do
    it 'has many purchases' do
      have_many(:purchases)
    end
  end

  describe 'validation' do
    it 'has valid attributes' do
      expect(@group).to be_valid
    end

    it 'has an invalid name value' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'has an invalid icon value' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'has an invalid user value' do
      @group.user_id = nil
      expect(@group).to_not be_valid
    end
  end
end
