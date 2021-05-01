class CommentsController < ApplicationController

    def create
        byebug
        Comment.create(comment_params)
        render json: {message: 'comment created'}
    end

    private

    def comment_params
        params.require(:new_comment).permit(:user_id, :recipe_id, :comment)
    end
end
