# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Recipe.destroy_all
Ingredient.destroy_all
RecipeItem.destroy_all
User.destroy_all
Like.destroy_all
Comment.destroy_all


200.times do 
    Ingredient.create(name: Faker::Food.ingredient)
end

u1 = User.create(username: 'willowdog', password:'123')
u2 = User.create(username: 'sportyspice', password:'123')
u3 = User.create(username: 'tombrady', password:'123')
 
rec = Recipe.create(name: 'Curried Chicken', instructions: 'Sautee the chicken in olive oil with curry and other spices and vegetables. It will be delicious and you will enjoy it.', description: 'Scrumptious curry and chicken', img: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190509-coconut-chicken-curry-157-1558039780.jpg?crop=0.668xw:1.00xh;0.116xw,0&resize=980:*', user_id: u1.id)

RecipeItem.create(recipe_id: rec.id, quantity: 5, quantity_type: 'tbsp', ingredient_id: Ingredient.all[0].id)
RecipeItem.create(recipe_id: rec.id, quantity: 100, quantity_type: 'gram', ingredient_id: Ingredient.all[1].id)
RecipeItem.create(recipe_id: rec.id, quantity: 51.5, quantity_type: 'cup', ingredient_id: Ingredient.all[2].id)

Like.create(user_id: u1.id, recipe_id: rec.id)
Like.create(user_id: u3.id, recipe_id: rec.id)
Like.create(user_id: u2.id, recipe_id: rec.id)

Comment.create(user_id: u1.id, recipe_id: rec.id, body: 'Such nums')
Comment.create(user_id: u2.id, recipe_id: rec.id, body: 'This is so tasty I will eat it every day.')
Comment.create(user_id: u3.id, recipe_id: rec.id, body: 'I love this chicken curry more than I love football.')

puts "it's all seedy baby"