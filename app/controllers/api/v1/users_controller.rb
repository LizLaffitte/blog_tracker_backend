class Api::V1::UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :email, :password, :at_key]
    before_action :find_user, only: [:show, :destroy, :update]
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: UserSerializer.new(user)
        else
            render json: {errors: "Something went wrong"}
        end
    end

    def show
        if @user
            render json: UserSerializer.new(@user)
        end
    end

    def update
        if @user.update(user_params)
            render json: UserSerializer.new(@user)
        else
            render json: {errors: "Something went wrong"}
        end
    end

    def destroy
        @user.destroy
        render json: {notice: "User deleted."}
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :at_key)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end
end
