require 'rest-client'
class Book < ActiveRecord::Base
    has_many :book_rosters
    def self.get_books(query)
        params = {
            key: ENV["GOOGLE_BOOK_API_KEY"],
            maxResults: 5,
            printType: "books",
            orderBy: "relevance",
            projection: "lite",
            q: query,
        }
        response = RestClient.get("https://www.googleapis.com/books/v1/volumes",{params: params})
        data = JSON.parse(response)["items"]
        data.map do |book|
            "'#{book["volumeInfo"]["title"]}' by #{book["volumeInfo"]["authors"][0]}. Published by #{book["volumeInfo"]["publisher"]}."
        end
    end
    
end