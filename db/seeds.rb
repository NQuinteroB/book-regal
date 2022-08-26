
require "open-uri"

file100years = URI.open("https://upload.wikimedia.org/wikipedia/commons/4/40/Cienanosdesoledad.jpg")
fileouthetre = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/96/Book_cover_in_and_out_of_theatre.jpg")
fileBoostCircuit = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/2b/The_Boost_Circuit_book_cover.jpg")
fileraceafter = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/cc/Race_After_Technology_-_Book_Cover.jpg")
fileharrypotter = URI.open("https://images-na.ssl-images-amazon.com/images/I/81m1s4wIPML.jpg")
filegamethones = URI.open("https://upload.wikimedia.org/wikipedia/en/thumb/d/dc/A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg/220px-A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg")
davinci = URI.open("https://i.weltbild.de/p/der-da-vinci-code-184054651.jpg?v=3&wp=_ads-minzoom2")
angels = URI.open("https://images-na.ssl-images-amazon.com/images/I/81adkKbGZgL.jpg")
oneday = URI.open("https://images-na.ssl-images-amazon.com/images/I/61VTNjezzpL.jpg")
it = URI.open("https://m.media-amazon.com/images/I/41lsFYcB-7S.jpg")
ann = URI.open("https://i.weltbild.de/p/das-tagebuch-der-anne-frank-072278943.jpg?v=3&wp=_ads-minzoom2")
sapiens = URI.open("https://images-na.ssl-images-amazon.com/images/I/4124bI5HGlL._SX327_BO1,204,203,200_.jpg")
puts "h"
# hugocabret = URI.open("https://assets.thalia.media/img/artikel/e2db1d1d6b39ba23be1380acc91293bb26477f87-00-00.jpeg")

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
  language: "Spanish",
  address: "Hohenzollernring 32-34, 50672 Köln"
)
book1.user = user1
book1.photo.attach(io: file100years, filename: "100years.png", content_type: "image/png")
book1.save!

book2 = Book.new(
  title: "Out of theatre",
  book_category: "Drama",
  language: "English",
  address: "Magnusstraße 20 Friesenplatz, Alte Wallgasse, 50672 Köln"
)
book2.user = user1
book2.photo.attach(io: fileouthetre, filename: "fileouthetre.png", content_type: "image/png")
book2.save!

book3 = Book.new(
  title: "The boost circuit",
  book_category: "Action",
  language: "English",
  address: "Rudolfpl. 1, 50674 Köln"
)
book3.user = user2
book3.photo.attach(io: fileBoostCircuit, filename: "boost.png", content_type: "image/png")
book3.save!

book4 = Book.new(
  title: "Race after technology",
  book_category: "Knowledge",
  language: "English",
  address: "Brüsseler Str. 90, 50672 Köln"
)
book4.user = user2
book4.photo.attach(io: fileraceafter, filename: "race.png", content_type: "image/png")
book4.save!

book5 = Book.new(
  title: "Harry Potter and the philiosophal stone",
  book_category: "Science Fiction",
  language: "English",
  address: "Maastrichter Str. 22, 50672 Köln"
)
book5.user = user3
book5.photo.attach(io: fileharrypotter, filename: "harry.png", content_type: "image/png")
book5.save!

book6 = Book.new(
  title: "Game of thrones",
  book_category: "Science Fiction",
  language: "English",
  address: "Aachener Str. 12, 50674 Köln"
)
book6.user = user3
book6.photo.attach(io: filegamethones, filename: "thrones.png", content_type: "image/png")
book6.save!

book7 = Book.new(
  title: "The Da Vinci code",
  book_category: "Crime",
  language: "English",
  address: "Bahnhofsvorpl. 1, 50667 Köln"
)
book7.user = user3
book7.photo.attach(io: davinci, filename: "vinci.png", content_type: "image/png")
book7.save!

book8 = Book.new(
  title: "Angels and Demons",
  book_category: "Thriller",
  language: "English",
  address: "Tunisstraße, 50668 Köln"
)
book8.user = user3
book8.photo.attach(io: angels, filename: "angels.png", content_type: "image/png")
book8.save!

book9 = Book.new(
  title: "One Day",
  book_category: "Fiction",
  language: "German",
  address: "Unter Goldschmied 19-9, 50667 Köln"
)
book9.user = user2
book9.photo.attach(io: oneday, filename: "oneday.png", content_type: "image/png")
book9.save!

book10 = Book.new(
  title: "El italiano",
  book_category: "Fiction",
  language: "Spanish",
  address: "Siegburger Str, 50679 Köln"
)
book10.user = user2
book10.photo.attach(io: it, filename: "it.png", content_type: "image/png")
book10.save!

book11 = Book.new(
  title: "Anna Frank Tagenbuch",
  book_category: "Reality",
  language: "German",
  address: "Pantaleonswall 8, 50676 Köln"
)
book11.user = user1
book11.photo.attach(io: ann, filename: "ann.png", content_type: "image/png")
book11.save!


book12 = Book.new(
  title: "Sapiens",
  book_category: "Reality",
  language: "German",
  address: "Christian-Schult-Straße 11, 50823 Köln"
)
book11.user = user1
book11.photo.attach(io: sapiens, filename: "sapiens.png", content_type: "image/png")
book11.save!


puts "Create 3 bookings and reviews..."

review1 = Review.new(
  content: "It is very well written and the events are told in an agile way, very good ingredients for the narration of a story. However, I didn't like what it tells.",
)
review1.user = user1
review1.book = book7
review1.save!

booking1 = Booking.new(
  start_time: Date.parse("01-10-2022"),
  end_time: Date.parse("15-10-2022")
)
booking1.user = user1
booking1.book = book1
booking1.save!

review2 = Review.new(
  content: "This is a pretty formulaic page turner, a fun quick read. Written at about the level of the average Nancy Drew mystery, it is best appreciated at that level.",
)
review2.user = user2
review2.book = book7
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
