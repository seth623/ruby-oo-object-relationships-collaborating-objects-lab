class Song

    @@all = []
    attr_accessor :name, :artist 

    def initialize(name)
        @name = name
        @@all << self  
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end 
    
    def self.new_by_filename(filename)
        
        split_filename = filename.split("-")
        stripped_names = split_filename.collect{ |w| w.strip }
        stripped_names[2].gsub(/\.mp3/, "")

        new_song = Song.new(stripped_names[1])
        new_song.artist_name = stripped_names[0]

        new_song 

    end

    def self.all 
        @@all 
    end 

end 