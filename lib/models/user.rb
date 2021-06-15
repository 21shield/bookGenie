class User < ActiveRecord::Base
    has_many :reading_lists
    @@prompt = TTY::Prompt.new(active_color: :cyan, symbols: {marker: '📘', radio_on: 
    '📖', radio_off: ' '})

    def self.prompt
        @@prompt
    end


    def self.login
        response = prompt.ask("Enter Your Username")
        !!response ? (response): (self.incorrect_info)
        found_user = User.find_by(username: response)
        found_user ? found_user : self.incorrect_info
        
    end

    def guest_login
        guest = User.find_by_create_by(username: "Guest")
        
    end

    def self.register_new_user
        username = self.prompt.ask("Create a Username #{"Must be 3 characters or greater and not contain and spaces or special characters".colorize(:light_black)}\n") do |answer|
            answer.validate (/\w{3,}/)
            answer.messages[:valid?] = 'Invalid username, try again'.colorize(:red)
        end

        if User.find_by(username: username) 
            puts "Username already taken!".colorize(:red)
            sleep(2)
            print "\r" + ("\e[A\e[K"*3)
            self.register_new_user
        else
            User.create(username: username)
            puts "Username successfully created!".colorize(:cyan)
            sleep(2)
        end
        
    end

    def get_reading_list_choices
        self.reading_lists.map do |list|
            {
                value: list["id"],
                name: list["name"],
            }
        end
    end

    def self.incorrect_info
        puts "INOCORRECT INPUT Please try again".colorize(:red)
        sleep(1)
        system 'clear'
        # Interface.welcome
        self.login

    end

end