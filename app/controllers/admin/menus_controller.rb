class Admin::MenusController < ApplicationController

  before_action :authenticate_admin!
  before_action :ensure_menu, only: [:show, :edit, :update, :destroy]

  def new
    @menu = Menu.new
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      all_menus = @genre.menus
    else
      all_menus = Menu.includes(:genre)
    end
    @menus = all_menus.page(params[:page])
    @all_menus_count = all_menus.count
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save! ? (redirect_to admin_menus_path(@menu)) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @menu.update(menu_params) ? (redirect_to admin_menu_path(@menu)) : (render :edit)
  end

  def destroy
   @menu.destroy
   redirect_to admin_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:genre_id, :menu_name, :introduction, :image, :price, :is_active)
  end

  def ensure_menu
    @menu = Menu.find(params[:id])
  end

end
