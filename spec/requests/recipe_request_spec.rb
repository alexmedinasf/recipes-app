require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before do
      @user = User.create(id: 10, name: 'HFG', email: 'xxx@xxx.com', password: '123456password',
          confirmed_at: Time.now)
      login_as(@user)
      @recipe = Recipe.create(name: 'Recipe 12', preparation_time: 5, cooking_time: 20, description: 'testing description', user: @user)
    end

  describe 'GET /recipes' do
    it 'works! (now write some real specs)' do
      get recipes_path
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      get recipes_path
      expect(response).to render_template('recipes/index')
    end  
  end

    describe 'GET /recipes' do
      it 'works! (now write some real specs)' do
        get recipe_path(@recipe)
        expect(response).to have_http_status(200)
      end
      it 'should render the correct template' do
        get recipe_path(@recipe)
        expect(response).to render_template('recipes/show')
      end  
    end

    describe 'GET /recipes' do
        it 'works! (now write some real specs)' do
          get new_recipe_path
          expect(response).to have_http_status(200)
        end
        it 'should render the correct template' do
          get new_recipe_path
          expect(response).to render_template('recipes/new')
        end  
      end
end