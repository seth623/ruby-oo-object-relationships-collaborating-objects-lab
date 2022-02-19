class Artist

    @@all = []
    attr_accessor :name 

    def initialize(name)
        @name = name
        @@all << self 
    end

    def add_song(song)
        song.artist = self  
    end 

    def self.find_or_create_by_name(name) 
        if self.all.find{ |artist| artist.name == name } == nil 
            self.new(name)
        else
            self.all.find{ |artist| artist.name == name } 
        end 
    end 

    def print_songs
        songs.each { |song| puts song.name }
    end 
    
    def self.all 
        @@all
    end
    
    def songs
        Song.all.select { |song| song.artist == self }
    end 

end 