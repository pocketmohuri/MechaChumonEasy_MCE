class Public::OrdersController < ApplicationController
  # before_action :authenticate_customer!
  # before_action :ensure_cart_items, only: [:new, :confirm, :create, :error]

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:select_address] == '0'
      @order.get_shipping_informations_from(current_customer_table)
    elsif params[:select_address] == '1'
      @selected_address = customer_tables_name.addresses.find(params[:address_id])
      @order.get_shipping_informations_from(@selected_address)
    elsif params[:select_address] == '2' && (@order.postal_code =~ /\A\d{7}\z/) && @order.destination? && @order.name?
      # 処理なし
    else
      flash[:error] = '情報を正しく入力して下さい。'
      render :new
    end
  end

  def error
  end

  def create
    @order = customer_tables_name.orders.new(order_params)
    @order.shipping_cost = 800
    @order.grand_total = @order.shipping_cost + @cart_items.sum(&:subtotal)
    if @order.save
      @order.create_order_details(customer_tables_name)
      redirect_to thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  def index
    @orders = current_customer_table.orders.includes(:order_details, :menus).page(params[:page]).reverse_order
  end

  def show
    @order = current_customer_table.orders.find(params[:id])
    @order_details = @order.order_details.includes(:menus)
  end

  private

  def order_params
    params.require(:order).permit(:total_payment, :menu_name)
  end

  def ensure_cart_items
    @cart_items = current_customer.cart_items.includes(:menu)
    redirect_to menus_path unless @cart_items.first
  end
end
