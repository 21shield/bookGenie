require_relative '../config/environment'

book_genie_interface = Interface.new()
book_genie_interface.welcome
user_instance = book_genie_interface.login_register_prompt
book_genie_interface.user = user_instance
book_genie_interface.main_page
