class FavoritesController < ApplicationController
  before_filter :authenticate_user

  def index
    @favorites = @current_user.favorites
  end

  def new

  end

  def create
    favorite = Favorite.new
    favorite.build_favorites(params, @current_user)
    redirect_to favorites_path(@current_user)
  end

end
