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
        render json: {
            id: user.id,
            username: user.username,
            my_recipes: user.recipes,
            liked_recipes: user.likes.map{|like| like.recipe}
        }
    end

    private
    
    def user_params
        params.require(:new_user).permit(:username, :password)
    end

end
