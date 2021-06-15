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
            {
                value: {
                    title: book["volumeInfo"]["title"],
                    author: book["volumeInfo"]["authors"][0],
                    publisher: book["volumeInfo"]["publisher"]
                },
                name: self.format_book_info(book["volumeInfo"])
            } 
        end     

    end

    def self.format_book_info(book)        
        if book.instance_of? Book
    
            "  📖 \"#{book["title"]}\"   Author: #{book["author"]}\n    Publisher: #{book["publisher"]}"
        else
            "  📖 \"#{book["title"]}\"\n   Author: #{book["authors"][0]}\n    Publisher: #{book["publisher"]}"
        end
    end


    
end