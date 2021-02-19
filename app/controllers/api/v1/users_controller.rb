class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :email, :password, :at_key]

    def create
        user = User.new(user_params)
        session[:user_id] = user.id
        render json: UserSerializer.new(user)
    end

    def show

    end

    def edit
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :at_key)
    end
end
