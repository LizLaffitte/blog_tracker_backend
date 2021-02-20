class Api::V1::BlogsController < ApplicationController
    def index
        client_site = params[:website]
        if client_site
            response = HTTParty.get(client_site + "/wp-json/wp/v2/posts")   
            render json: response.body
        else
            render json: {errors: "No website supplied."}
        end
    end
end