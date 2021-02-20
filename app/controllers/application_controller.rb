class ApplicationController < ActionController::API
    helper_method :current_user
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end


    def logged_in?
        !!session[:user_id]
    end
end
