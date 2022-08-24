class Admin::AdminOrderDetailsController < ApplicationController
 before_action :authenticate_admin!

  def update
    @admin_order_detail = AdminOrderDetail.find(params[:id])
    @order = @admin_order_detail.admin_order
    @admin_order_details = AdminOrderDetail.where(order_id: @order.id)
    @check_status = @admin_order_details.where.not(making_status: 0)
    if @admin_order_detail.update(order_detail_params)
      @admin_order_detail.change_making_status
      redirect_to admin_admin_order_path(@order)
    else
      render 'show'
    end
  end

  private

  def order_detail_params
    params.require(:admin_order_detail).permit(:making_status)
  end

end
