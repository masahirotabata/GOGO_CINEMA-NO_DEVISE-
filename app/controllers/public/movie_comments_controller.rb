class Public::MovieCommentsController < ApplicationController
  def new
    @movie= Movie.find_by(id: params[:id])
    @movie_comment = MovieComment.new
  end

  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @movie_comment = MovieComment.new(movie_comment_params)
    @movie_comment.movie_id = @movie.id
    @movie_comment.customer_id = current_customer
      if @movie_comment.save!
        redirect_to public_movies_path(@movie)
      else
        render 'new'
      end
  end

   def index
     @movie = Movie.find_by(id: params[:movie_id])
     @movie_comments = MovieComment.where(movie_id: params[:@movie_id])
     @customer = current_customer

   end

def movie_comment_params
  params.require(:movie_comment).permit(:movie_id, :customer_id, :rate, :comment)
end


end