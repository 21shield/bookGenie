class BookRoster < ActiveRecord::Base
    belongs_to :reading_list
    belongs_to :book


end