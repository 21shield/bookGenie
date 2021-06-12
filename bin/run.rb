require_relative '../config/environment'

book_genie_interface = Interface.new()
book_genie_interface.welcome
book_genie_interface.choose_login_or_register
puts "hello world"