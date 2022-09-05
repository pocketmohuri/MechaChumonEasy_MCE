class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page])
  end

  def new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def show
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      unless @genre.is_active
        @genre.menus.update_all(is_active: false)
      end
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

   private

  def genre_params
    params.require(:genre).permit(:genres_name, :is_active)
  end

  def ensure_genre
    @genre = Genre.find(params[:id])
  end

end
