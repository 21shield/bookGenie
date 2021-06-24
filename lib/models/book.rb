require 'rest-client'
require 'active_record'
require 'tty-prompt'

class Book < ActiveRecord::Base

    has_many :book_rosters
    @@prompt = TTY::Prompt.new(active_color: :cyan, symbols: {marker: '📘', radio_on:'📖', radio_off: ' '})

    def self.prompt
        @@prompt
    end

    def self.get_books(query)
        params = {
            key: ENV["GOOGLE_BOOK_API_KEY"],
            maxResults: 5,
            printType: "books",
            orderBy: "relevance",
            projection: "lite",
            q: query,
        }
        begin
            response = RestClient.get("https://www.googleapis.com/books/v1/volumes",{params: params})
            data = JSON.parse(response)["items"]
            data.map do |book|
                {
                    value: {
                        title: book["volumeInfo"]["title"],
                        author: book["volumeInfo"]["authors"][0] ? (book["volumeInfo"]["authors"][0]) : ("Unknown"),
                        publisher: book["volumeInfo"]["publisher"] ? (book["volumeInfo"]["publisher"]) : ("N/A")
                    },
                    name: self.format_book_info(book["volumeInfo"])
                } 
            end 
        rescue StandardError => err
            puts "Oops! 404" 
        end
    end

    def self.select_and_create_book(books)
        selected_book = prompt.select("Add a book to your reading list", books)
        Book.find_or_create_by(selected_book)
    end

    def self.format_book_info(book)        
        if book.instance_of? Book
    
            "  📖 \"#{book["title"]}\"   Author: #{book["author"]}\n    Publisher: #{book["publisher"]}"
        else
            "  📖 \"#{book["title"]}\"\n   Author: #{book["authors"][0]}\n    Publisher: #{book["publisher"]}"
        end
    end


    
end