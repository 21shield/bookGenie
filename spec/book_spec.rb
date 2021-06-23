# class methods are prefixed with a dot (".add"), 
# instance methods with a dash ("#add").
# require "./lib/book.rb"
describe Book do 

    describe ".get_books" do 
        context "Given a query" do
            it "Should return an array of objects" do
                expect(Book.get_books("harry potter")).to eq(0)
            end
        end
    end

end