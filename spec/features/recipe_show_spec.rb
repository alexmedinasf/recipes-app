require 'rails_helper'

RSpec.feature 'Recipes Show', type: :feature do

  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
        confirmed_at: Time.now)
    login_as(@user)
  end

  scenario 'Has toggle Public button' do
    recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipe_path(recipe)
    expect(page).to have_button('Public')
  end

  scenario 'Public button toggles' do
    recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, public: true, description: 'testing description', user: @user)
    visit recipe_path(recipe)
    click_button 'Public'
    expect(page).to have_button('Not Public')
  end

  scenario 'Click on Shopping Button button' do
    recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipe_path(recipe)
    click_link 'Generate Shopping List'
    expect(current_path).to eq(general_shopping_list_path)
  end

  scenario 'Click on Add new Ingredient button' do
    recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipe_path(recipe)
    click_link 'Add new ingredient'
    expect(current_path).to eq(new_recipe_recipe_food_path(recipe))
  end

  scenario 'Has tablewith recipe details' do
    recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipe_path(recipe)
    expect(page).to have_selector('table')
  end
end