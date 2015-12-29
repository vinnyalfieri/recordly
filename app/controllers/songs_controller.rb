class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @album = Album.new
    @artist = Artist.new
  end

  def edit

  end

  def create
    @song = Song.create(song_params)
    if @song.persisted?
      redirect_to songs_path
    end
  end

  def update

  end


  def destroy

  end

  private

  def song_params
    params.require(:song).permit(:title, :album_id, :artist_id, :album_attributes => [:name], :artist_attributes => [:name])
  end

end
