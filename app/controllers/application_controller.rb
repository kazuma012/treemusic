class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	private

	def after_sign_up_path_for(resource)
      public_home_top_path
    end

    def after_sign_in_path_for(resource)
      public_home_top_path
    end

    def after_sign_out_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, 
          keys:[
            :last_name, 
            :first_name, 
            :sub_last_name, 
            :sub_first_name, 
            :phone_number 
          ])
    end
end
