class AlbumsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    if @album.songs
      @songs = @album.songs
    end
    if @album.artist
      @songs = @album.songs
    end
  end

  def new
    @album = Album.new
    @song = Song.new
    @artist = Artist.new
  end

  def edit

  end

  def create
    @album = Album.new
    @album.create_artist_song(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
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

  def album_params
    params.require(:album).permit(:name, :song_ids, :artist_id, :song => [:title], :artist => [:name])
  end

end
