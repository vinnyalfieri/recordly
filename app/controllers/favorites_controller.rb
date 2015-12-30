class FavoritesController < ApplicationController
  before_filter :authenticate_user

  def index
    @favorites = @current_user.favorites
  end

  def new

  end

  def create
    favorite = Favorite.new


    # @current_user.favorites.build(favoritable: Artist.find(params[:artist]))


    favorite.favoritable = Artist.find(params[:artist])
    binding.pry
    @current_user.favorites << favorite
    @current_user.save


    @current_user.favorites.build(favoritable: Song.find(params[:song]))
    favorite.favoritable = Song.find(params[:song])
    @current_user.favorites << favorite
    @current_user.save

    @current_user.favorites.build(favoritable: Album.find(params[:album]))
    favorite.favoritable = Album.find(params[:album])
    @current_user.favorites << favorite
    @current_user.save


  end

end
