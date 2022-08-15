class Public::MenusController < ApplicationController

   def index
    @genres = Genre.where(is_active: true)
    if params[:genres_id]
      @genre = @genres.find(params[:genres_id])
      all_menus = @genre.menus
    else
      all_menus = Menu.where(genre_id: @genres.ids).includes(:genre)
    end
    @menus = all_menus#.page(params[:page]).per(12)
    @all_menus_count = all_menus.count
   end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_item = CartItem.new
  end

end
