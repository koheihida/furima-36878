FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'あああ' }
    family_name           { 'あああ' }
    first_name_kana       { 'アアア' }
    family_name_kana      { 'アアア' }
    birthday              { '2000-01-01' }
  end
end
