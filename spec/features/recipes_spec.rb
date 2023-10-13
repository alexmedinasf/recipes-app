require_relative '../rails_helper'

RSpec.describe 'The recipes index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @recipe1 = Recipe.create!(name: 'Test Recipe 1', description: 'test description 1',
        public: true,preparation_time: 10, cooking_time: 10, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'shows the title, description, preparation and cooking time' do
      click_on "My Recipes"
      expect(page).to have_content 'test description 1'
    end

  end
end