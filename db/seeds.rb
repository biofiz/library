# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |i|
  Book.create(name: "Book ##{i}", author: "Author ##{i}", publisher: "Publisher ##{i}", year: 2000 + i,
              language: "русский", extension: "djvu", size: 10 + i, pages: 100 + i)
end
