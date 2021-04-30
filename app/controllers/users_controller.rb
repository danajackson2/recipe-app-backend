class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        byebug
        if user.valid?
            token = encode_token({user_id: user.id})
            render json: {username: user.username, user_id: user.id, token: token}
        else
            render json: {error: 'Failed to create user'}, status: :not_acceptable
        end
    end

    private
    
    def user_params
        params.require(:new_user).permit(:username, :password)
    end

end
