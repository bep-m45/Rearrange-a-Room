class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    case resource
      when Member
        members_path(current_member)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when :admin
        new_admin_session_path
      when :member
        new_member_registration_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname])
  end
end
