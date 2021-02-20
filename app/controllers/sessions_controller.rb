class SessionsController < ApplicationController
    def create
        if @user && @user.authenticate(params[:session][:password])
            login(@user.id)
            render json: UserSerializer.new(@user)
        elsif @user
            render json: {errors: "Incorrect credentials"}
        else
            render json: {errors: "User does not exist"}
        end
    end

    def destroy
        session.clear
        render json: {notice: "User logged out"}
    
    end

    private
    def find_user
        @user = User.find_by(params[:session][:username])
    end

    def login(id)
        session[:user_id] = id
    end


end