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
            puts "logging in ...."
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
        self.welcome
        puts "         #{user.username}          #{"Book Genie".colorize(:light_cyan)}"
        choices = {search: "searching for books", "reading list": "look at reading lists" }
        prompt.select("What would you like to do today?", choices)
        binding.pry
    end

    def new_user
        system 'clear'
        new_interface = Interface.new()
        Interface.welcome
        binding.pry
        # this below will call the remaining methods
        # user = new_interface.login_register_prompt
        # new_interface.user = user

        #  Main.welcome
        # new_interface.users_interface(user)
    end
    
end