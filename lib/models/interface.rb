class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new(active_color: :cyan, symbols: {marker: '📘', radio_on: 
        '📖', radio_off: ' '})
    end

    def welcome
        puts "Welcome to Book Genie"
    end

    def login_register_prompt
        selection = prompt.select("Logging in? or Registering?", ["Logging in", "Registering", "Guest"])
        if selection == "Logging in"
            # calls function that handles loggining
            puts "logging in ...."
            current_user = User.login   
        elsif selection == "Registering"
            # calls function that handles registering
            puts "registering..."
            current_user = User.register_new_user
        else
            # calls funtion that log ins a "guest"
            current_user = User.guest_login
        end
        
        binding.pry    

    end
    def main_page
        system 'clear'
        puts "#{user.username}          #{"Book Genie".colorize(:light_cyan)}\n\n"

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