class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.a
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genres_path
    else
      @genre = Genre.new
      render :index
    end
  end

  def edit
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
