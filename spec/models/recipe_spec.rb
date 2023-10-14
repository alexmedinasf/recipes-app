require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
                        confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20,
                            description: 'testing description', user: @user)
  end

  describe 'validations' do
    it 'should include recipe name' do
      expect(@recipe.name).to eq('Recipe 12')
    end

    it 'should not be valid if it dont include name' do
      @recipe.name = nil
      expect(@recipe).not_to be_valid
    end

    it 'should include preparation_time' do
      expect(@recipe.preparation_time).to eq(5)
    end

    it 'should not be valid without preparation time' do
      @recipe.preparation_time = nil
      expect(@recipe).not_to be_valid
    end

    it 'should include cooking_time' do
      expect(@recipe.cooking_time).to eq(20)
    end

    it 'should not be valid without cooking time' do
      @recipe.cooking_time = nil
      expect(@recipe).not_to be_valid
    end

    it 'should include description' do
      expect(@recipe.description).to eq('testing description')
    end

    it 'should not be valid without description' do
      @recipe.description = nil
      expect(@recipe).not_to be_valid
    end
  end
end
