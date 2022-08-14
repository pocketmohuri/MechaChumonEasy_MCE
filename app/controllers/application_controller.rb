class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_tables_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:customer_tables_name])
  end

  def after_sign_in_path_for(resource)
    menus_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
