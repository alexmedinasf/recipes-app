class Recipe < ApplicationRecord
  # associations
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy, foreign_key: 'recipe_id'
  has_many :foods, through: :recipe_foods

  # validations
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  # helper method for clarity
  def public?
    is_public
  end

  # add any other methods as per your application's needs
end
