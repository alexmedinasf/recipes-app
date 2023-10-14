require 'rails_helper'

RSpec.feature 'Food', type: :feature do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
                        confirmed_at: Time.now)
    login_as(@user)
  end

  scenario 'Fill the add new food form' do
    visit new_food_path
    fill_in 'Food name', with: 'Nachos'
    select 'units', from: 'Measure Unit'
    fill_in 'Unit price', with: 10
    fill_in 'Amount of food', with: 5

    click_button 'Add Food'

    expect(current_path).to eq(foods_path)
  end

  scenario 'New food View' do
    visit new_food_path
    expect(page).to have_content('Add')
  end
end
