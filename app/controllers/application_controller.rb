class ApplicationController < ActionController::API
    include ActionController::Helpers
    include Knock::Authenticable

    def logged_in?
        !!session[:user_id]
    end

end
