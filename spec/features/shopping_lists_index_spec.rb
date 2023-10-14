require 'rails_helper'

RSpec.feature 'Shopping List', type: :feature do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
                        confirmed_at: Time.now)
    login_as(@user)
  end

  scenario 'Shopping List' do
    visit general_shopping_list_path
    expect(page).to have_content('Shopping List')
  end

  scenario 'Shopping List' do
    visit general_shopping_list_path
    expect(page).to have_content('Amount of items to buy')
  end

  scenario 'Has table with shopping list details' do
    visit general_shopping_list_path
    expect(page).to have_selector('table')
  end
end
