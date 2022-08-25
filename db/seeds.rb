
require "open-uri"

file100years = URI.open("https://upload.wikimedia.org/wikipedia/commons/4/40/Cienanosdesoledad.jpg")
fileouthetre = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/96/Book_cover_in_and_out_of_theatre.jpg")
fileBoostCircuit = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/2b/The_Boost_Circuit_book_cover.jpg")
fileraceafter = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/cc/Race_After_Technology_-_Book_Cover.jpg")
fileharrypotter = URI.open("https://images-na.ssl-images-amazon.com/images/I/81m1s4wIPML.jpg")
filegamethones = URI.open("https://upload.wikimedia.org/wikipedia/en/thumb/d/dc/A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg/220px-A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg")

puts "Deleting old Seeds..."

Booking.destroy_all
Review.destroy_all
Book.destroy_all
User.destroy_all

puts "Old seeds deleted!!!"
puts "Creating data..."

user1 = User.new(
  first_name: "Natalia",
  last_name: "Quintero",
  birth_date: Date.parse("10-10-1980"),
  email: "natalia@gmail.com",
  password: "123456"
)
user1.save!

user2 = User.new(
  first_name: "Johnson",
  last_name: "Darko",
  birth_date: Date.parse("10-10-1980"),
  email: "johnson@gmail.com",
  password: "123456"
)
user2.save!

user3 = User.new(
  first_name: "Diego",
  last_name: "Rodriguez",
  birth_date: Date.parse("10-10-1980"),
  email: "diego@gmail.com",
  password: "123456"
)
user3.save!

book1 = Book.new(
  title: "100 años de soledad",
  book_category: "Novel",
  language: "Spanish"
)
book1.user = user1
book1.photo.attach(io: file100years, filename: "100years.png", content_type: "image/png")
book1.save!

book2 = Book.new(
  title: "Out of theatre",
  book_category: "Drama",
  language: "English"
)
book2.user = user1
book2.photo.attach(io: fileouthetre, filename: "fileouthetre.png", content_type: "image/png")
book2.save!

book3 = Book.new(
  title: "The boost circuit",
  book_category: "Action",
  language: "English"
)
book3.user = user2
book3.photo.attach(io: fileBoostCircuit, filename: "boost.png", content_type: "image/png")
book3.save!

book4 = Book.new(
  title: "Race after technology",
  book_category: "Knowledge",
  language: "English"
)
book4.user = user2
book4.photo.attach(io: fileraceafter, filename: "race.png", content_type: "image/png")
book4.save!

book5 = Book.new(
  title: "Harry Potter and the philiosophal stone",
  book_category: "Science Fiction",
  language: "English"
)
book5.user = user3
book5.photo.attach(io: fileharrypotter, filename: "harry.png", content_type: "image/png")
book5.save!

book6 = Book.new(
  title: "Game of thrones",
  book_category: "Science Fiction",
  language: "English"
)
book6.user = user3
book6.photo.attach(io: filegamethones, filename: "thrones.png", content_type: "image/png")
book6.save!


puts "Create 3 bookings and reviews..."

review1 = Review.new(
  content: "Really nice book",
)
review1.user = user1
review1.book = book1
review1.save!

booking1 = Booking.new(
  start_time: Date.parse("01-10-2022"),
  end_time: Date.parse("15-10-2022")
)
booking1.user = user1
booking1.book = book1
booking1.save!

review2 = Review.new(
  content: "Interesting reading",
)
review2.user = user2
review2.book = book2
review2.save!

booking2 = Booking.new(
  start_time: Date.parse("15-07-2022"),
  end_time: Date.parse("23-08-2022")
)
booking2.user = user2
booking2.book = book2
booking2.save!

review3 = Review.new(
  content: "Interesting reading",
)
review3.user = user3
review3.book = book3
review3.save!

booking3 = Booking.new(
  start_time: Date.parse("15-07-2022"),
  end_time: Date.parse("23-08-2022")
)
booking3.user = user3
booking3.book = book3
booking3.save!

puts "Finished!"
