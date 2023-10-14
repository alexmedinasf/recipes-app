require 'rails_helper'

RSpec.describe 'shopping List', type: :request do
  before do
    @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
                        confirmed_at: Time.now)
    login_as(@user)
  end

  describe 'GET /shopping' do
    it 'works! (now write some real specs)' do
      get general_shopping_list_path
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      get general_shopping_list_path
      expect(response).to render_template('shopping_lists/index')
    end
  end
end
