ActiveAdmin.register FeatureRequest do
  permit_params { FeatureRequest.attribute_names }

  controller do
    def index
      index! do
        collection.order('client_priority asc, updated_at desc')
      end
      # @feature_requests = FeatureRequest
      #   .page(params[:page]).per(params[:per_page])
    end
  end
end
