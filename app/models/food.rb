class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end