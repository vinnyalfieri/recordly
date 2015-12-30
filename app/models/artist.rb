class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums
  belongs_to :favoritable
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.create_from_song(params)
      if params["artist_id"] == ""
      @artist = Artist.create(params["artist_attributes"])
    else
      @artist = Artist.find(params["artist_id"])
    end
  end

  def self.create_from_album(params)
    if params["artist_id"] == ""
      @artist = Artist.create(params["artist"])
    else
      @artist = Artist.find(params["artist_id"])
    end
  end

  def create_song_album(params)
    self.name = params["name"]
    @song = Song.create_from_artist(params, self)
    @album = Album.create_from_artist(params, self)
    self.albums << @album
    @song.artist = self
    @album.songs << @song
    self.save
  end

end