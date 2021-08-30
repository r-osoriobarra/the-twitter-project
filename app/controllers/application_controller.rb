class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception #para que no se caiga cuando adminactive varias sesiones abiertas
    before_action :configure_permit_params, if: :devise_controller?

    def configure_permit_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])
    end

end
