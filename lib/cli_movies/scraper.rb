class CliMovies::Scraper


    def get_page 
        Nokogiri::HTML(open("https://www.imdb.com/chart/boxoffice?ref_=nv_ch_cht"))
    end

    def box_office 
        movie_hash = {:titles => [], :wgross => [], :ogross => []}
        get_page.css("tbody tr").each.with_index(1) do |td, index|
            # titles clear
            movie_hash[:titles] << "#{index}. #{td.css("td.titleColumn a").text}"
            # wgross ?
            movie_hash[:wgross] << td.css("td.ratingColumn:nth-of-type(odd)").text.strip
            # ogross ?
            movie_hash[:ogross] << td.css("td.ratingColumn:nth-of-type(even)").text.strip
        end
        movie_hash
    end

end