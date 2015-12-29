require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Artist.destroy_all
  Song.destroy_all
  Album.destroy_all
  

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest"


  def get_json(url)
    JSON.load(open(url))
  end

  def build_info(music_hash)
    music_hash["tracks"].each do |track|
      album = Album.find_or_create_by({ name: track['album_name']})
      song = Song.find_or_create_by({ title: track['track_name']})
      artist = Artist.find_or_create_by({ name: track['artist_name']})
      album.artist = artist
      song.artist = artist
      song.album = album
      
      artist.save
      album.save
      song.save
    end
  end
  def most_streamed
    music_hash = get_json(BASE_URL)
    build_info(music_hash)
  end

  most_streamed


