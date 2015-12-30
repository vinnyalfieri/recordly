class Search
  attr_accessor :artists, :songs, :albums
  attr_reader :search_term

  def initialize(search_term)
    @search_term = search_term
    search
  end

  def search
    search = "%#{@search_term.downcase}%"
    self.artists = find_artist(search)
    self.albums = find_album(search)
    self.songs = find_song(search)
  end

  def find_artist(search)
    result = Artist.where('LOWER(name) LIKE ?', search)
    if !result.empty?
      return result.compact
    end
  end

  def find_album(search)
    result = Album.where('LOWER(name) LIKE ?', search)
    if !result.empty?
      return result.compact
    end
  end

  def find_song(search)
    result = Song.where('LOWER(title) LIKE ?', search)
    if !result.empty?
      return result.compact
    end
  end

  def status
    if self.artists == nil || self.albums == nil || self.songs == nil
      return false
    else
      return true
    end
  end



end
