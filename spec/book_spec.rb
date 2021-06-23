# class methods are prefixed with a dot (".add"), 
# instance methods with a dash ("#add").
require "spec_helper"
require 'active_record'

RSpec.describe Book do 
    
    describe ".get_books" do 
        context "Given a query" do
            it "should return an array of objects" do
                expect(Book.get_books("harry potter")).to(true)
            end
        end
    end

end