class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    @albums = @artist.albums
  end

  def new
    @artist = Artist.new
  end

  def edit

  end

  def create
    @artist = Artist.create(artist_params)
    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update

  end


  def destroy

  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end


end
