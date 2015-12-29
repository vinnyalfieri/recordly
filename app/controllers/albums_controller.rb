class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit

  end

  def create
    @album = Album.create(album_params)
    if @album.persisted?
      redirect_to albums_path
    end
  end

  def update

  end


  def destroy

  end

  private

  def album_params
    params.require(:album).permit(:name)
  end

end
