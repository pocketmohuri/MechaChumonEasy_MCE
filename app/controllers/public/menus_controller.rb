class Public::MenusController < ApplicationController

   def index
    @genres = Genre.where(is_active: true)
    if params[:genres_id]
      @genre = @genres.find(params[:genres_id])
      all_menus = @genre.items
    else
      all_menus = Menu.where(genres_id: @genres.ids).includes(:genres)
    end
    @menus = all_menus#.page(params[:page]).per(12)
    #kaminariを導入したらコメントアウト解除
    @all_menus_count = all_menus.count
   end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_item = CartItem.new
  end

end
