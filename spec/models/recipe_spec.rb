require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
    it { should have_many(:foods).through(:recipe_foods) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:preparation_time) }
    it { should validate_presence_of(:cooking_time) }
    it { should validate_presence_of(:description) }
  end

  describe '#public?' do
    let(:recipe) { build(:recipe, is_public: true) }

    it 'returns true if the recipe is public' do
      expect(recipe.public?).to eq(true)
    end
  end
end
