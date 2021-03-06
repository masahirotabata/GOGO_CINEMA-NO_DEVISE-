class Admin::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    @movie.customer_id = Admin.find(1)
    if @movie.save
      flash[:notice] ="映画の投稿に成功しました"
      redirect_to admin_movies_path
    else
      render "new"
    end
  end
  
  def index
    @movies = Movie.all
  end
  
  def edit
    @movie = Movie.find_by(id: params[:id])
  end
  
  def update
    @movie = Movie.find_by(id: params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "映画を編集しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @movie = Movie.find_by(params[:id])
  end
  
  private
    def movie_params
      params.require(:movie).permit(:movie_name, :image, :genre, :datail)
    end
end
  