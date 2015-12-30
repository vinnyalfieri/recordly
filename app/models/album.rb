class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs, dependent: :destroy
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
end
