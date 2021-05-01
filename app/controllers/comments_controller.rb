class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        render json: comment
    end

    private

    def comment_params
        params.require(:new_comment).permit(:user_id, :recipe_id, :body)
    end
end
