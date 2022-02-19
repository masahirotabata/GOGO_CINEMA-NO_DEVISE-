class Public::MovieCommentsController < ApplicationController
  def new
    @movies_comment = MovieComment.new
    @movie_comment = Movie.find(params[:movie_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movies_comment = Moviescomment.new(params[:movies_comment_params])
    @movies_comment_id = @movies_comment.id
    @movies_comment.customer_id = current_customer.id
      if @movies_comment.save
        redirect_to public_customer_path(current_customer)
      else
        render 'new'

  end

def movies_comment_params
  params.require(:movies_comment).permit(:movie_id, :customer_id, :rate, :comment)
end

end