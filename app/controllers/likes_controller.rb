class LikesController < ApplicationController

    def create
        byebug
        Like.create(like_params)
        render json: {message: 'like created'}
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :recipe_id)
    end

end
