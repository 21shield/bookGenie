require_relative '../config/environment'

book_genie_interface = Interface.new()
# creates a new instance of a interface
book_genie_interface.welcome
# Accesses the interface welcome sign
user_instance = book_genie_interface.login_register_prompt
book_genie_interface.user = user_instance
book_genie_interface.main_page
