User.destroy_all
Book.destroy_all
ReadingList.destroy_all
BookRoster.destroy_all

luna = User.create(username: "LunaLovegood")

quibbler = ReadingList.create(name: "Research List", user_id: luna.id)

hp1 = Book.create(title: "Socercers Stone", author: "J.K Rowling", publishing_company: "millers")

BookRoster.create(book: hp1, reading_list: quibbler)

puts "Done Seeding"