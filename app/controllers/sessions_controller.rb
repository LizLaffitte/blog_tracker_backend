require 'pry'
class SessionsController < ApplicationController
    before_action :authenticate_user
    def create
        if current_user && current_user.authenticate(params[:session][:password])
            login(current_user.id)
            render json: UserSerializer.new(current_user)
        else
            render json: {errors: "User does not exist"}
        end
    end

    def destroy
        session.clear
        render json: {notice: "User logged out"}
    
    end

    private

    def login(id)
        session[:user_id] = id
    end


end