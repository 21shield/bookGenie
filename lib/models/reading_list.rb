class ReadingList < ActiveRecord::Base
    belongs_to :user
    has_many :book_rosters
    has_many :books, through: :book_rosters
end