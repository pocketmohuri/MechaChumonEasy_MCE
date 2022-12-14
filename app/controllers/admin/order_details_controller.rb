class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = OrderDetail.where(order_id: @order.id)
    @check_status = @order_details.where.not(making_status: 0)
    if @order_detail.update(order_detail_params)
      @order_detail.change_making_status
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
