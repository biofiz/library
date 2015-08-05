FactoryGirl.define do
  factory :book do
    user
    name            { Faker::Lorem.sentence }
    author          { Faker::Name.name }
    publisher       { Faker::Lorem.word }
    year            2015
    language        'русский'
    extension       'djvu'
    size            '20 Мб'
    pages           125
    user_id         1
    isbn            Faker::Code.isbn
    quality         'отличное'
    series          Faker::Lorem.word
    description     Faker::Lorem.paragraph(12)
    image           "http://s017.radikal.ru/i434/1202/15/620452ebec8c.jpg"
    link1           "http://rusfolder.com/44004991"
  end
end
