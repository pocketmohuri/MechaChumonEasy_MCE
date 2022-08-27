class Public::MenusController < ApplicationController

   def index
    @genres = Genre.where(is_active: true)
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_menus = @genre.menus
    else
      all_menus = Menu.where(genre_id: @genres.ids).includes(:genre)
    end
    @menus = all_menus.page(params[:page]).per(6)
    @all_menus_count = all_menus.count
   end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_item = CartItem.new
  end

end
