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
        main_menu()
       
    end

    def main_menu
        selection = prompt.select("Main Menu") do |menu|
            menu.choice "Search For Books", -> {search_books}
            menu.choice "View Reading Lists", -> {view_reading_lists}
            menu.choice "Exit", -> {new_session}
        end
    end

    def search_books
        query = prompt.ask("Search by Title or Author")
        books = Book.get_books(query)

        puts "Showing #{books.length} results for \"#{query}\": ".colorize(:yellow)

        book = Book.select_and_create_book(books)
        # in the case that there are no reading list create oneb
        reading_list_choices = user.get_reading_list_choices

        selected_list = prompt.select("Which Reading List?", reading_list_choices)
        BookRoster.create(book: book, reading_list_id: selected_list[:id])

        puts " #{book[:title]} was added to #{selected_list[:name]}"
        sleep(1)
        main_page()
    end

    def view_reading_lists
        system 'clear'
        reading_list = prompt.select("Which Reading List Would You Like To See?", user.get_reading_list_choices)
        book_list = reading_list[:rl_instance].books.map do |book|
           puts Book.format_book_info(book)
           sleep(1)
        end
        sleep(2)
        main_page()
    end

    def new_session
        system 'clear'
        self.user = nil
        self.user = login_register_prompt()
        main_page()
    end
    
end