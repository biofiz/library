# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@example.com', password: 'password', role: 4)
User.create(email: 'librarian@example.com', password: 'password', role: 3)
User.create(email: 'native@example.com', password: 'password', role: 2)
User.create(email: 'user@example.com', password: 'password', role:1)
User.create(email: 'demo@example.com', password: 'password')

20.times do |i|
  Book.create(name: Faker::Lorem.sentence, author: Faker::Name.name, publisher: Faker::Lorem.word, year: 1990 + i,
              language: "русский", extension: "djvu", size: 10 + i, pages: 100 + i, user_id: 1, isbn: Faker::Code.isbn,
              quality: "отличное", series: Faker::Lorem.word, description: Faker::Lorem.paragraph(12), image: "http://s017.radikal.ru/i434/1202/15/620452ebec8c.jpg",
              link1: "http://rusfolder.com/44004991")
end
