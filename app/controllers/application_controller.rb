class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception #para que no se caiga cuando adminactive varias sesiones abiertas
    before_action :configure_permit_params, if: :devise_controller?
    before_action :suspended?, if: :user_signed_in?

    private
    def configure_permit_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])
    end

    def suspended?
        if current_user.suspended
            sign_out current_user
            redirect_to root_path, notice: "Sorry, you are suspended"
        end
    end
    
end
