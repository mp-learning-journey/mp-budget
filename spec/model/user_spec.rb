require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do
     @user = User.create(name: 'Test user', email: 'test@gmail.com', password: '123456',
    password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    end

  describe 'association' do
    it 'has many posts' do
      have_many(:groups)
    end
    it 'has many comments' do
      have_many(:purchases)
    end
  end

  describe 'validation' do
    it 'has a valid attributes' do
      expect(@user).to be_valid
    end

    it 'has an invalid name value' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  
    it 'has an invalid email value' do
        @user.email = nil
        expect(@user).to_not be_valid
    end

    it 'has an invalid password value' do
        @user.password = nil
        expect(@user).to_not be_valid
      end
      it 'is not valid with a password confirmation that does not match' do
        @user.password_confirmation = '12345'
        expect(@user).to_not be_valid
      end
      it 'is not valid with a password shorter than 6 characters' do
        @user.password = '12345'
        expect(@user).to_not be_valid
      end
  end

end
