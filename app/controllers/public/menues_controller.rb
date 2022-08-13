class Public::MenuesController < ApplicationController

   def index
    @genres = Genre.where(is_active: true)
    if params[:genres_id]
      @genre = @genres.find(params[:genres_id])
      all_menues = @genre.items
    else
      all_menues = Menu.where(genres_id: @genres.ids).includes(:genres)
    end
    @menues = all_menues#.page(params[:page]).per(12)
    #kaminariを導入したらコメントアウト解除
    @all_menues_count = all_menues.count
   end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_item = CartItem.new
  end

end
