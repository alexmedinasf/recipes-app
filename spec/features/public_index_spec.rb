require 'rails_helper'

RSpec.feature 'Public Recipes', type: :feature do

  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
        confirmed_at: Time.now)
    login_as(@user)
    recipe = Recipe.create(name: 'Recipe 22', preparation_time: 5, cooking_time: 20, public: true, description: 'testing description', user: @user)
  end
 
  scenario 'Public Recipe list' do
    visit public_recipes_path
    expect(page).to have_content('Recipe 22')
  end

  scenario 'Public Recipe list' do
    visit public_recipes_path
    expect(page).to have_content('Total food')
  end

  scenario 'Public Recipe list' do
    visit public_recipes_path
    expect(page).to have_content('HFG')
  end
end
