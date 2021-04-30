class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create #login/signup
        user = User.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {username: user.username, user_id: user.id, token: token}
        else
            render json: {error: 'User could not be found'}, status: 401
        end
    end

    def show #persist
        render json: {username: @user.username, user_id: @user.id}
    end

end