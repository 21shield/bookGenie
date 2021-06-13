require_relative '../config/environment'

book_genie_interface = Interface.new()
book_genie_interface.welcome
user = book_genie_interface.login_register_prompt
binding.pry
puts "hello world"