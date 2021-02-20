class Api::V1::ClientsController < ApplicationController
    before_action :find_client, only: [:show, :update, :destroy]
    def create
        client = current_user.clients.build(client_params)
        if client.save
            render json: ClientSerializer.new(client)
        else
            render json: {errors: "Client could not be created"}
        end
    end

    def show
        render json: ClientSerializer.new(@client)
    end

    def index
        @clients = current_user.clients
        render json: ClientSerializer.new(@clients)
    end

    def update
        if @client.update(client_params)
            render json: ClientSerializer.new(@client)
        else
            render json: {errors: "Cannot update client"}
        end
    end

    def destroy
        @client.destroy
        render json: {notice: "Client deleted."}
    end

    private
    def client_params
        params.require(:client).permit(:name, :website, :at_base, :at_table)
    end

    def find_client
        @client = Client.find_by_id(params[:id])
    end
end
