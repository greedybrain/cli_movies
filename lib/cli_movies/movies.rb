class CliMovies::Movie

    @@all = []

    attr_accessor :title, :wgross, :ogross

    def initialize(title=nil, wgross=nil, ogross=nil)
        @title = title 
        @wgross = wgross 
        @ogross = ogross
        @@all << self
    end

    def self.create 
        movie = CliMovies::Scraper.new
        movie.box_office
        i = 0
        while i < movie.box_office[:titles].length
            self.new(
                movie.box_office[:titles][i], 
                movie.box_office[:wgross][i], 
                movie.box_office[:ogross][i]
            )
            i += 1
        end
    end

    def self.all
        @@all
    end

end