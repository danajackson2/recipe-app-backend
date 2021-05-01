class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_items, dependent: :destroy
  has_many :ingredients, through: :recipe_items
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
