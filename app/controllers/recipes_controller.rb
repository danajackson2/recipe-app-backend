class RecipesController < ApplicationController

    def index
        recipes = Recipe.all
        recipe_output = recipes.map do |rec| 
            comments = rec.comments.map{|c| {username: c.user.username, body: c.body, created_at: c.created_at}}
            ingredients = rec.recipe_items.map{|i| {name: i.ingredient.name, quantity: i.quantity, quantity_type: i.quantity_type}}
            {
                id: rec.id,
                name: rec.name,
                description: rec.description,
                img: rec.img,
                instructions: rec.instructions,
                username: rec.user.username,
                likes: rec.likes.length,
                ingredients: ingredients,
                comments: comments
            }
        end
        render json: recipe_output
    end

end
