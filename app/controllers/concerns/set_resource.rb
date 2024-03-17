module SetResource
    extend ActiveSupport::Concern

    included do 
        before_action :set_resource, only: [:show, :update, :destroy, :publish]
    end

    private

    def set_resource
        resource = controller_name.classify.constantize
        instance_variable_set("@#{controller_name.singularize}", resource.find(params[:id]))
    end

end