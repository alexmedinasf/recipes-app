require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
    before do
        @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
            confirmed_at: Time.now)
        @recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
        @food = Food.create(name: 'test', price: 8, quantity: 30, measurement_unit: 'liters', user: @user)   
        @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 10)
    end

  describe 'validations' do
  
    it 'should include recipe id' do
      expect(@recipe_food).to be_valid
    end    

    it 'should include quantity' do
        expect(@recipe_food.quantity).to eq(10)
      end    
  
      it 'should not be valid without quantity' do
          @recipe_food.quantity = nil
          expect(@recipe_food).not_to be_valid
      end
   end
end
