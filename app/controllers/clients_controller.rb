class ClientsController < InheritedResources::Base

  private

    def client_params
      params.require(:client).permit(:name)
    end
end

