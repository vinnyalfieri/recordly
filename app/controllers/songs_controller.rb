class SongsController < ApplicationController
  before_filter :authenticate_user
  
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
    @song = Song.new
    @song.create_album_artist(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update

  end


  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js # rails default: go to views/todos/destroy.js.erb
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :album_id, :artist_id, :album_attributes => [:name], :artist_attributes => [:name])
  end

end
