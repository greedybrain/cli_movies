class CliMovies::CLI 

    def call
        puts "\nToday's Top of the Box Office"
        show_title_list
        show_movie_data
        choose_another?
    end
  
    def choice
        while true
            puts "\nEnter the movie number you'd like for the respective gross amount, or type 'exit':"
            input = gets.chomp.downcase
            if input == 'exit'
                goodbye
            elsif !(0..9).include?(input.to_i - 1)
                puts "\nSorry, you chose a list number that does not exist, try again, or type 'exit'."
            else
                input = input.to_i
                break
            end
        end
        input
    end

    def show_title_list
        puts "\nHere is a list of the Top 10 Box Office Movies!".red
        puts "\nLoading Box Office Movies ...".green
        CliMovies::Movie.create
        CliMovies::Movie.all.each do |m|
            puts "\n#{m.title.yellow}"
        end

    end

    def show_movie_data
        users = CliMovies::CLI.new
        movies = CliMovies::Movie.all
        movie_choice = movies[users.choice - 1]
        puts "#{movie_choice.title.red} / Weekend Gross: #{movie_choice.wgross.yellow} / Overall Gross: #{movie_choice.ogross.green}"
    end

    def choose_another? 
        while true
            puts "\nWould you like another movie?(Y/n)"
            input = gets.chomp.to_s.downcase
            if input == 'y'
                show_movie_data
            else
                goodbye
            end
        end
    end
    
    def goodbye
      puts "\nCome back for more movie info next week!"
      exit!
    end

end
