class User < ApplicationRecord
    has_secure_password
    has_many :clients


    def self.from_token_request(request)
        User.find_by(username: request.params[:user_token][:auth][:username])
    end

end
