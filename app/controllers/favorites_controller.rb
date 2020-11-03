class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_favorite = @book.favorites.new(book_id: @book.id)
    @book_favorite.user_id = current_user.id
    @book_favorite.save
    redirect_to request.referer
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    favorite.destroy
    redirect_to request.referer
  end
end

