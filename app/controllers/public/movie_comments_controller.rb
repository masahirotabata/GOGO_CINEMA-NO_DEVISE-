class Public::MovieCommentsController < ApplicationController
  def new
    @movie= Movie.find_by(id: params[:id])
    @movie_comment = MovieComment.new
  end
  
  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @movie_comment = MovieComment.new(movie_comment_params)
    @movie_comment.movie_id = @movie.id
    @movie_comment.customer_id = session[:customer_id]
      if @movie_comment.save!
        redirect_to public_movies_path(@movie)
      else
        render 'new'
      end
  end

   def index

     @customer = Customer.find_by(id: params[:id])
     @movie = Movie.find_by(id: params[:movie_id])
     @movie_comments = MovieComment.where(movie_id: @movie.id)

   end

   def destroy

     @movie_comment = MovieComment.find_by(id: params[:id])
     @movie_comment.destroy
     redirect_to public_movies_path(@movie)

   end

    def avg_score
    unless self.comments.empty?
      comments.average(:rate_id).round(1)
    else
      0.0
    end
  end

 def avg_score_percentage
   unless self.comments.empty?
     comments.average(:rate_id).round(1).to_f*100/5
   else
     0.0
   end
 end

def movie_comment_params
  params.require(:movie_comment).permit(:movie_id, :customer_id, :rate, :comment)
end


end