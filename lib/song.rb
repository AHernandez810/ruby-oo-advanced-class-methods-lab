class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    self.all << song 
    song
  end 

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end 

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end 

  def self.find_by_name(song_title)
    song = self.all.find{|song| song.name== song_title }
    song
  end

  def self.find_or_create_by_name(song_title)
    song = self.find_by_name(song_title)
    if song
      song 
    else 
      self.create_by_name(song_title)
    end 
  end 

  def self.alphabetical
    sorted_songs = self.all.sort_by{|song| song.name}
    sorted_songs
  end 

  def self.new_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    song
  end 

  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end
  
end
