require 'rails_helper'

RSpec.describe Food, type: :model do
    before do
        @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
            confirmed_at: Time.now)
        @food = Food.create(name: 'test', price: 8, quantity: 30, measurement_unit: 'liters', user: @user)

        end

  describe 'validations' do
  
    it 'should include food name' do
      expect(@food.name).to eq('test')
    end    

    it 'should not be valid if it doesnt include name' do
        @food.name = nil
        expect(@food).not_to be_valid
    end

    it 'should include price' do
        expect(@food.price).to eq(8)
      end    
  
      it 'should not be valid without price' do
          @food.price = nil
          expect(@food).not_to be_valid
      end


    it 'should include quantity' do
        expect(@food.quantity).to eq(30)
      end    
  
      it 'should not be valid without quantity' do
          @food.quantity = nil
          expect(@food).not_to be_valid
      end
 
      it 'should include measurement unit' do
        expect(@food.measurement_unit).to eq('liters')
      end    
   end
end
