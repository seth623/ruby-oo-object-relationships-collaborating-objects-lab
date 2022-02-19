class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path 
    end 

    def files
        files_array = []
        
        Dir.entries(@path).each do |file|
            if file.end_with?(".mp3")
                files_array << file 
            end 
        end 

        return files_array 
    end 

    def import 
        files.each do |file|
            Song.new_by_filename(file)
        end 
    end 

end 