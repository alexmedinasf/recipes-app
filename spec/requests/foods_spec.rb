require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
                        confirmed_at: Time.now)
    login_as(@user)
  end

  describe 'GET /foods' do
    it 'works! (now write some real specs)' do
      get foods_path
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      get foods_path
      expect(response).to render_template('foods/index')
    end
  end

  describe 'GET /foods' do
    it 'works! (now write some real specs)' do
      get new_food_path
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      get new_food_path
      expect(response).to render_template('foods/new')
    end
  end
end
