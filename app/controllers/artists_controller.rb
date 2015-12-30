class ArtistsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    @albums = @artist.albums
  end

  def new
    @song = Song.new
    @album = Album.new
    @artist = Artist.new
  end

  def edit

  end

  def create
    @artist = Artist.new
    @artist.create_song_album(artist_params)
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
    @artist = Artist.find(params[:id])
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js # rails default: go to views/todos/destroy.js.erb
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :song_ids, :album_ids, :song => [:title], :album => [:name])
  end


end
