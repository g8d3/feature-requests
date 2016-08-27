class FeatureRequestsController < InheritedResources::Base

  private

    def feature_request_params
      params.require(:feature_request).permit(:title, :descrtiption, :client_id, :client_priority, :target_date, :ticket_url, :product_area)
    end
end

