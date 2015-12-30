class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  belongs_to :favoritable
  accepts_nested_attributes_for :album, :artist
  validates_presence_of :title


  def create_album_artist(params)
    self.title = params["title"]
    @artist = Artist.create_from_song(params)
    @album = Album.create_from_song(params)
    self.album = @album
    self.artist = @artist
    @artist.albums << @album
    self.save
  end

  def self.create_from_album(params)
    if params["song_ids"] == ""
      @song = Song.create(params["song"])
    else
      @song = Song.find(params["song_ids"])
    end
  end

  def self.create_from_artist(params, object)
    if params["song_ids"] == ""
      @song = Song.create(params["song"])
      @song.artist = object
    else
      @song = Song.find(params["song_ids"])
      @song.artist = object
    end
    @song.save
    @song
  end

end
