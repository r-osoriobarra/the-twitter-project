class ApplicationController < ActionController::Base
    before_action :configure_permit_params, if: :devise_controller?

    def configure_permit_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])
    end

end
