require 'rails_helper'

RSpec.describe(Purchase, test: :model) do
    before(:each) do
        @user = User.new(name: 'Test user', email: 'test@gmail.com', password: '123456')
        @group = Group.new(name: 'Test Group', user: @user)
        @group.icon.attach(
            io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'dominos.png')),
            filename: 'dominos.png',
            content_type: 'image/png'
        )
        @purchase = Purchase.new(name: 'Test purchases', amount: 100, author: @user, group: @group)
      end

      describe 'validation' do
        it 'has valid attributes' do
          expect(@purchase).to be_valid
        end
    
        it 'has a valid name' do
          @purchase.name = nil
          expect(@purchase).to_not be_valid
        end

        it 'has a valid amount' do
            @purchase.amount = nil
            expect(@purchase).to_not be_valid
          end
    
        it 'has an valid group' do
          @purchase.group = nil
          expect(@purchase).to_not be_valid
        end
    
        it 'has a valid user' do
          @purchase.author = nil
          expect(@purchase).to_not be_valid
        end

    end
end