require 'rails_helper'

RSpec.feature 'Recipe', type: :feature do

  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
        confirmed_at: Time.now)
    login_as(@user)
  end
 
  scenario 'User Recipe list' do
    Recipe.create(name: 'Recipe 2', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipes_path
    expect(page).to have_content('Recipe 2')
  end

  scenario 'User Recipe list' do
    Recipe.create(name: 'Recipe 3', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipes_path
    expect(page).to have_selector('button', text: 'Delete')
  end

  scenario 'User Recipe list' do
    Recipe.create(name: 'Recipe 5', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    visit recipes_path
    expect(page).to have_content('testing description')
  end
end
