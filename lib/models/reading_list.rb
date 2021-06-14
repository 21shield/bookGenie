class ReadingList < ActiveRecord::Base
    belongs_to :user
    has_many :book_rosters
    has_many :books, through: :book_rosters

    def self.get_reading_list_choices
        binding.pry
        user.reading_lists.map do |list|
            {
                value: list["id"],
                name: list["name"],
            }
        end
    end

end