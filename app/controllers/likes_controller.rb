class LikesController < ApplicationController

    def create
        like = Like.create(like_params)
        render json: like
    end

    def destroy
        Like.find(params[:id]).destroy
        render json: {message: 'like destroyed'}
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :recipe_id)
    end

end
