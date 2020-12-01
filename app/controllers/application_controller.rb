class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_guest
    email = resource&.email || params[:member][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  private
  
  def after_sign_in_path_for(resource)

    case resource
      when Member
        member_path(current_member)
      when Admin
        admins_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when :admin
        new_admin_session_path
      when :member
       root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname])
  end
end
 