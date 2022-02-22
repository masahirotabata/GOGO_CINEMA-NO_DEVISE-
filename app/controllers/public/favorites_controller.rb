class Public::FavoritesController < ApplicationController

  def create
    @movie_comment = MovieComment.find(params[:movie_comment_id])
    favorite = @movie_comment.favorites.new(customer_id: current_customer.id)
    favorite.save
    flash[:success] = "Liked post"
    redirect_to request.referer
  end

  def destroy
    @movie_comment = MovieComment.find(params[:movie_comment_id])
    favorite = @movie_comment.favorites
    favorite.destroy
    redirect_to request.referer
  end

end
