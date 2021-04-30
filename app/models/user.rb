class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :recipes
    has_many :likes, dependent: :destroy
    has_many :recipes, through: :likes
    has_many :pantry_items, dependent: :destroy
    has_many :ingredients, through: :pantry_items
end
