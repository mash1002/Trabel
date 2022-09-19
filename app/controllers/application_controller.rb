class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      trips_path
    elsif admin_signed_in?
      admins_customers_path
    else
      root_path
    end
  end
end
