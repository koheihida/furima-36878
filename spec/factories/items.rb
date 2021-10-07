FactoryBot.define do
  factory :item do
    goode_name          { Faker::Name.initials(number: 2) }
    explanation         { Faker::Name.initials(number: 2) }
    category_id         { '2' }
    detail_id           { '2' }
    postage_id          { '2' }
    prefecture_id       { '2' }
    period_date_id      { '2' }
    price               { 1000 }
    id                  {"1"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
