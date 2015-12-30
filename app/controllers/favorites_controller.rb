class FavoritesController < ApplicationController
  before_filter :authenticate_user

  def index
    @favorites = @current_user.favorites
  end

  def new

  end

  def create
    favorite = Favorite.new
    favorite.favoritable = Song.find(params[:song])
    favorite.user = @current_user
    favorite.save
  end

end
