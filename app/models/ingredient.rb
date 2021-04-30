class Ingredient < ApplicationRecord
    has_many :recipe_items
    has_many :pantry_items
end
