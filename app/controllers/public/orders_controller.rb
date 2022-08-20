class Public::OrdersController < ApplicationController
  # before_action :authenticate_customer!
  # before_action :ensure_cart_items, only: [:new, :confirm, :create, :error]

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer_table.cart_items
    # if params[:select_address] == '0'
    #   @order.get_shipping_informations_from(current_customer_table)
    # elsif params[:select_address] == '1'
    #   @selected_address = customer_tables_name.addresses.find(params[:address_id])
    #   @order.get_shipping_informations_from(@selected_address)
    # elsif params[:select_address] == '2' && (@order.postal_code =~ /\A\d{7}\z/) && @order.destination? && @order.name?
    #   # 処理なし
    # else
    #   flash[:error] = '情報を正しく入力して下さい。'
    #   render :new
    # end
  end

  def error
  end

  def create
    @order = current_customer_table.orders.new
    total_amount = 0
    current_customer_table.cart_items.each do |cart_item|
    total_amount += cart_item.menu.price.to_i * cart_item.amount
    end
    @order.total_payment = total_amount
    @order.status = 0
    if @order.save
      cart_items = current_customer_table.cart_items
      cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.order_id = @order.id
        @order_details.menu_id = cart_item.menu_id
        @order_details.price = cart_item.price
        @order_details.amount = cart_item.amount
        @order_details.save
      end

      redirect_to  complete_orders_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    @orders = current_customer_table.orders.page(params[:page]).reverse_order
  end

  def show
    pp current_customer_table
    @order = current_customer_table.orders.find(params[:id])
    @order_details = @order.order_details.includes(:menus)
  end

  private

  def ensure_cart_items
    @cart_items = current_customer.cart_items.includes(:menu)
    redirect_to menus_path unless @cart_items.first
  end
end
