class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  accepts_nested_attributes_for :album, :artist
end
