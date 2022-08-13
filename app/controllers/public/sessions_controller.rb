# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  #   def new
  # # #   super
  #   end

  # # # POST /resource/sign_in
  def create
    target = CustomerTable.find_by(customer_tables_name: params[:customer_table][:customer_tables_name])
    if target != nil
      sign_in target
    end
    super
  end

  # # # DELETE /resource/sign_out
  #   def destroy
  # # #   super
  #   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:customer_tables_name])
  end


end


