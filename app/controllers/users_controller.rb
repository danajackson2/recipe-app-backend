class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token({user_id: user.id})
            user_likes = Likes.all.select{|like| like.user_id == user.id}
            render json: {username: user.username, user_id: user.id, token: token, likes: user_likes}
        else
            render json: user.errors.messages, status: :not_acceptable
        end
    end

    def show
        user = User.find(params[:id])
        # date_formatted_my_recipes = user.recipes.map{|r|
        #     {
        #         id: r.id,
        #         name: r.name,
        #         user_id: r.user_id,
        #         instructions: r.instructions,
        #         description: r.description,
        #         img: r.img,
        #         created_at: r.created_at.strftime('%y-%m-%d-%H-%M-%S'),
        #         likes: r.likes.length
        #     }
        # }
        # date_formatted_liked_recipes = user.likes.map{|like| like.recipe}.map{|r|
        #     {
        #         id: r.id,
        #         name: r.name,
        #         user_id: r.user_id,
        #         instructions: r.instructions,
        #         description: r.description,
        #         img: r.img,
        #         created_at: r.created_at.strftime('%y-%m-%d-%H-%M-%S'),
        #         likes: r.likes.length
        #     }
        # }
        render json: {
            username: user.username,
            # my_recipes: date_formatted_my_recipes,
            # liked_recipes: date_formatted_liked_recipes
        }
    end

    private
    
    def user_params
        params.require(:new_user).permit(:username, :password)
    end

end
