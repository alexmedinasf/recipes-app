require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /public_recipes' do
    it 'works! (now write some real specs)' do
      get public_recipes_path
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      get public_recipes_path
      expect(response).to render_template('public_recipes/index')
    end  
  end
end
