FactoryGirl.define do
  factory :comment do
    book
    user
    content { Faker::Lorem.sentence }
  end
end