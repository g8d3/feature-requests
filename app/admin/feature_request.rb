ActiveAdmin.register FeatureRequest do
  permit_params { FeatureRequest.attribute_names }

  controller do
    def index
      @feature_requests = FeatureRequest
        .page(params[:page]).per(params[:per_page])
    end
  end
end
