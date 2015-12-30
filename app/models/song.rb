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
    artist.albums << @album
    self.save
  end

end
