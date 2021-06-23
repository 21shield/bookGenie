# class methods are prefixed with a dot (".add"), 
# instance methods with a dash ("#add").
require "spec_helper"

RSpec.describe Book do 
    test_search_result = [
        {:value=>{:title=>"Harry Potter Coloring Book", :author=>"Inc. Scholastic", :publisher=>"Scholastic Incorporated"}, :name=>"  📖 \"Harry Potter Coloring Book\"\n   Author: Inc. Scholastic\n    Publisher: Scholastic Incorporated"}, {:value=>{:title=>"Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out", :author=>"Felicity Baker", :publisher=>"N/A"}, :name=>"  📖 \"Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out\"\n   Author: Felicity Baker\n    Publisher: "}, {:value=>{:title=>"Harry Potter: The Complete Collection (1-7)", :author=>"J.K. Rowling", :publisher=>"Pottermore Publishing"}, :name=>"  📖 \"Harry Potter: The Complete Collection (1-7)\"\n   Author: J.K. Rowling\n    Publisher: Pottermore Publishing"}, {:value=>{:title=>"Harry Potter and Philosophy", :author=>"David Baggett", :publisher=>"Open Court Publishing"}, :name=>"  📖 \"Harry Potter and Philosophy\"\n   Author: David Baggett\n    Publisher: Open Court Publishing"}, {:value=>{:title=>"Harry Potter and the Half-Blood Prince", :author=>"J. K. Rowling", :publisher=>"N/A"}, :name=>"  📖 \"Harry Potter and the Half-Blood Prince\"\n   Author: J. K. Rowling\n    Publisher: "}
    ]
    test_book = {"title" => "Harry Potter Coloring Book", "authors" => ["Inc. Scholastic"], "publisher"=> "Scholastic Incorporated"}


    describe ".get_books" do 
        context "Given a query" do
            it "should return an array of objects" do
                expect(Book.get_books("harry potter").length).to eq(5)
            end
        end
    end

    describe ".format_book_info" do
        context "given a book" do
            it "should format the books info" do
                expect(Book.format_book_info(test_book)).not_to be_empty
            end
        end
    end

end