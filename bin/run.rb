require_relative '../config/environment'

interface = book_genie_interface = Interface.new()
book_genie_interface.welcome
user_instance = book_genie_interface.login_register_prompt
interface.user = user_instance
interface.main_page
