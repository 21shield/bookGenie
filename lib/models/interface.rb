class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Welcome to Book Genie"
    end

    def choose_login_or_register
        prompt.select("Logging in? or Registering?", ["Logging in", "Registering"])
    end
    
end