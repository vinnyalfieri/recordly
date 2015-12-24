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
  
  @pinkfloyd = Artist.create({ name: 'Pink Floyd'})
  @zeppelin = Artist.create({ name: 'Led Zeppelin'})
  @rage = Artist.create({ name: 'Rage Against the Machine'})
  @queen = Artist.create({ name: 'Queen'})
  @blink = Artist.create({ name: 'Blink 182'})
  @van = Artist.create({ name: 'Van Morrison'})
  @nirvana = Artist.create({ name: 'Nirvana'})
  @strokes = Artist.create({ name: 'The Strokes'})
  @metallica = Artist.create({ name: 'Metallica'})
  

  @pinkfloyd_album = Album.create({name: 'Pink Floyds Album'})
  @pinkfloyd.albums << @pinkfloyd_album

  @song1 = Song.create({title: 'Welcome to the Machine'})
  @song1.artist = @pinkfloyd
  @song1.album = @pinkfloyd_album
  @song1.save
  @song2 = Song.create({title: 'Wish You Were Here'})
  @song2.artist = @pinkfloyd
  @song2.album = @pinkfloyd_album
  @song2.save
  @song3 = Song.create({title: 'Dogs'})
  @song3.artist = @pinkfloyd
  @song3.album = @pinkfloyd_album
  @song3.save
  @song4 = Song.create({title: 'Vera'})
  @song4.artist = @pinkfloyd
  @song4.album = @pinkfloyd_album
  @song4.save



