class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def check_guest
  email = resource&.email || params[:member][:email].downcase
  
  if email == 'guest@example.com'
     redirect_to member_path(current_member)
  end
end

private

def after_sign_in_path_for(resource)
  case resource
    when Member
      flash[:notice] = "Welecome" + current_member.nickname + "さん！"
      member_path(current_member)
    when Admin
      flash[:notice] = "Sign Inしました"
      admins_path
  end
end

def after_sign_out_path_for(resource)
  case resource
    when :admin
      flash[:notice] = "Sign Outしました"
      new_admin_session_path
    when :member
      flash[:notice] = "Sign Outしました"
      root_path
  end
end

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname])
end
end
