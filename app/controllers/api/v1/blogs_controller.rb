class Api::V1::BlogsController < ApplicationController
    def index
        client_site = params[:website]
        
        response = HTTParty.get(client_site + "/wp-json/wp/v2/posts")
        render json: response.body
    end
end