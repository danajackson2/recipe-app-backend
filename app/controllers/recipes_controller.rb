class RecipesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        byebug
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
                comments: comments,
                created_at: rec.created_at.strftime('%y-%m-%d')
            }
        end
        render json: recipe_output
    end

    def create
      byebug
      new_recipe = Recipe.create(name: params[:name], user_id: params[:user_id], 
        instructions: params[:instructions], description: params[:description], 
        img: params[:img])

      params[:recipe_items].each do |item|
        thisIngredient = Ingredient.find_or_create_by(name: item[:name])
        RecipeItem.create(quantity_type: item[:quantity_type], quantity: item[:quantity], 
          recipe_id: new_recipe.id, ingredient_id: thisIngredient.id)
      end
    end

end
