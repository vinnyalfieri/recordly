class Album < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  belongs_to :artist
  belongs_to :favoritable
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_associated :artist

  def self.create_from_song(params)
    if params["album_id"] == ""
      @album = Album.create(params["album_attributes"])
    else
      @album = Album.find(params["album_id"])
    end
  end

  def create_artist_song(params)
    self.name = params["name"]
    @song = Song.create_from_album(params)
    @artist = Artist.create_from_album(params)
    self.artist = @artist
    @song.album = self
    @song.artist = @artist
    self.songs << @song
    self.save
  end

  def self.create_from_artist(params, object)
    if params["album_ids"] == ""
      @album = Album.create(params["album"])
      @album.artist = object
    else
      @album = Album.find(params["album_ids"])
      @album.artist = object
    end
    @album.save
    @album
  end

end
