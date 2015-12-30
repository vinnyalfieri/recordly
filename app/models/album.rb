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
end
