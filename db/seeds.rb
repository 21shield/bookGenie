User.destroy_all
Book.destroy_all
ReadingList.destroy_all
BookRoster.destroy_all

guest = User.create(username: "Guest")

quibbler = ReadingList.create(name: "Research List", user_id: guest.id)

hp1 = Book.create(title: "Socercers Stone", author: "J.K Rowling", publisher: "millers")

BookRoster.create(book: hp1, reading_list: quibbler)

puts "Done Seeding"