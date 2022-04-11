class Public::FavoritesController < ApplicationController
  #更新　
  def create
    @movie_comment = MovieComment.find(params[:movie_comment_id])
    favorite = @movie_comment.favorites.new(customer_id: current_customer)
    favorite.save!
    flash[:notice] = "いいねしました"
    redirect_to request.referer
  end

  def destroy
    @movie_comment = MovieComment.where(movie_comment_id: params[:movie_comment_id])
    favorite = current_customer.favorites.find_by(movie_comment_id: @movie_comment.id)
    favorite.destroy
  end

end
