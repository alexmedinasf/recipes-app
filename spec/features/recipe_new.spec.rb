require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do

  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
        confirmed_at: Time.now)
    login_as(@user)
  end

  scenario 'Fill the add new recipe form' do
    visit new_recipe_path
    fill_in 'Recipe name ', with: 'Nachos'
    fill_in 'Preparation time', with: 10
    fill_in 'Cooking time', with: 5
    fill_in 'Recipe description', with: 'Muchos jalapenos'
    click_button 'Save new recipe'

    expect(current_path).to eq(recipes_path)
  end

  scenario 'New food View' do
    visit new_recipe_path
    expect(page).to have_content('save new recipe')
  end
end