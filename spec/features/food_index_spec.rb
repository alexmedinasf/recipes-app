require 'rails_helper'

RSpec.feature 'Food', type: :feature do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
                        confirmed_at: Time.now)
    login_as(@user)
    visit foods_path
  end

  scenario 'User food list' do
    expect(page).to have_content('Your Food List')
  end
  scenario 'User can view a list of food items' do
    Food.create(name: 'Food 1', price: 5, quantity: 20, measurement_unit: 'kilos', user: @user)
    Food.create(name: 'Food 2', price: 8, quantity: 30, measurement_unit: 'kilos', user: @user)

    visit foods_path
    expect(page).to have_content('Food 1')
    expect(page).to have_content('Food 2')
    expect(page).to have_content('5.0')
    expect(page).to have_content('20')
    expect(page).to have_content('8.0')
    expect(page).to have_content('30')
  end

  scenario 'User food list' do
    Food.create(name: 'Food 1', price: 5, quantity: 20, measurement_unit: 'kilos', user: @user)
    visit foods_path
    expect(page).to have_content('Delete')
  end

  scenario 'User food list' do
    Food.create(name: 'Food 1', price: 5, quantity: 20, measurement_unit: 'kilos', user: @user)

    click_link 'Add Food!'
    expect(current_path).to eq(new_food_path)
  end
end
