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
      session[:customer_table_id] = target.id
      sign_in target
    end
    super
  end

  # # DELETE /resource/sign_out
  def destroy
    target = session[:customer_table_id]
    if target != nil
      admin_order = AdminOrder.new
      order = Order.find_by(customer_table_id: target)
      admin_order.id = order.id
      order_details = OrderDetail.where(order_id: order.id)
      order_details.each do |order_detail|
        admin_order_detail = AdminOrderDetail.new
        admin_order_detail.order_id = order.order_id
        admin_order_detail.menu_id = order_detail.menu_id
        admin_order_detail.price = order_detail.price
        admin_order_detail.amount = order_detail.amount
        admin_order_detail.save
      end
      order.destroy
    end
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:customer_tables_name])
  end


end


