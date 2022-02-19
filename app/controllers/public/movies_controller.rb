class Public::MoviesController < ApplicationController
  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def index
  @movies = Movie.all
  end
  

  def create
  end

end
