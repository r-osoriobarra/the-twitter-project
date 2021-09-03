class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :configure_permit_params, if: :devise_controller?
    before_action :suspended?, if: :user_signed_in?

    private
    def configure_permit_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])
    end

    def suspended?
        if current_user.suspended
            sign_out current_user
            redirect_to suspended_path
        end
    end
    
end