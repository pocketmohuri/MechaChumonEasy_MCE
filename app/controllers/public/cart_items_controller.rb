class Public::CartItemsController < ApplicationController
   # before_action :authenticate_customer!
   #before_action :set_cart_item, only: [:create, :update, :destroy]

  def index
    @cart_items = current_customer_table.cart_items#.includes(:menu) # n+1問題向けなので時間があれば....
  end

  def create
    if @cart_item
      new_amount = @cart_item.amount + cart_item_params[:amount]
      @cart_item.update(amount: new_amount)
      redirect_to cart_items_path
    else
      @cart_item = current_customer_table.cart_items.new(cart_item_params)
      @menu = Menu.find(params[:cart_item][:menu_id])
      @cart_item.menu_id = @menu.id
      @cart_item.price = @menu.price
      if @cart_item.save
        redirect_to cart_items_path
      else
        render 'public/menu/show'
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params) if @cart_item
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy #if @cart_item
    redirect_to cart_items_path
  end

  def all_destroy
    current_customer_table.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

  def set_cart_item
    @menu = Menu.find(params[:menu_id])
    @cart_item = current_customer_table.has_in_cart(@menu)
  end
end
