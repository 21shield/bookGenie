class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new(active_color: :cyan, symbols: {marker: '📘', radio_on: 
        '📖', radio_off: ' '})
    end

    def welcome
        puts '88""Yb  dP"Yb   dP"Yb  88  dP      dP""b8 888888 88b 88 88 888888 '.colorize(:cyan)
        puts '88__dP dP   Yb dP   Yb 88odP      dP   `" 88__   88Yb88 88 88__   '.colorize(:cyan)
        puts '88""Yb Yb   dP Yb   dP 88"Yb      Yb  "88 88""   88 Y88 88 88""   '.colorize(:cyan)
        puts '88oodP  YbodP   YbodP  88  Yb      YboodP 888888 88  Y8 88 888888 '.colorize(:cyan)
    end

    def login_register_prompt
        selection = prompt.select("Logging in? or Registering?", ["Logging in", "Registering", "Guest"])
        if selection == "Logging in"
            current_user = User.login  
        elsif selection == "Registering"
            puts "registering..."
            current_user = User.register_new_user
        else
            current_user = User.guest_login
        end

         current_user

    end

    def main_page
        system 'clear'
        welcome()
        sleep(2)
        puts "\n.:.:.:.:.:  #{user.username.colorize(:yellow).blink}  .:.:.:.: #{"Book Genie".colorize(:light_cyan)} :.:.:.:.:.:.:.:.:.:.:."

        choices = [
            {
                name: "Search For Books", 
                value: 1
            },
            {
                name: "View Reading Lists", 
                value: 2
            }
        ]
        selection = prompt.select("What would you like to do today?", choices)
        selection == 1 ? self.search_books : self.view_reading_lists
        system 'clear'
    end

    def search_books
        system 'clear'
        self.welcome
        query = prompt.ask("Search by Title or Author")
        books = Book.get_books(query)

        puts "Showing #{books.length} results for \"#{query}\": ".colorize(:yellow)

        selected_book = prompt.select("Add a book to your reading list", books)
        book = Book.find_or_create_by(selected_book)

        # once selecting a reading list add the chosen book to the reading list
        # in the case that there are no reading list create one
        reading_list_choices = user.get_reading_list_choices
        

        selected_list = prompt.select("Which Reading List?", reading_list_choices)

        BookRoster.create(book: book, reading_list_id: selected_list["id"])

        puts " #{selected_book[:title]} was added to #{selected_list[:name]}"
        sleep(2)
        self.main_page
    end

    def view_reading_lists
        # must view a list of reading lists of the current user
        # when selecting the reading list open up to see the books within
        # be able to go back to the main menu when done
        # reading_list = ReadingList.current_user_lists(user)
        # user.reading_list()
        
        reading_list = prompt.select("Which Reading List Would You Like To See?", user.get_reading_list_choices)
        book_list = reading_list[:rl_instance].books.map do |book|
            Book.format_book_info(book)
        end
        binding.pry
        prompt.select("#{reading_list["name"]} Books: ", book_list)
        
    end

    def action_exit
        system 'clear'
        welcome()
        main_page()
    end

    def new_user
        system 'clear'
        new_interface = Interface.new()
        new_interface.welcome
    end
    
end