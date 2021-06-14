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
        # what if the search returns empty?
        # check if there is data to be returned else return a try again
        # if !!data 
            data.map do |book|
            
                "title: #{book["volumeInfo"]["title"]}, author: #{book["volumeInfo"]["authors"][0]}, publisher: #{book["volumeInfo"]["publisher"]}"
            end     
        # else
        #     "Try a different query."
        # end

    end

    
end