class Ingredient < ApplicationRecord
    has_many :recipe_items, dependent: :destroy
    has_many :pantry_items, dependent: :destroy
end