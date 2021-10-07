FactoryBot.define do
  factory :buys_address do
    token           {"tok_abcdefghijk00000000000000000"}
    user_id         {"1"}
    item_id         {"3"}
    postcode        {"123-1234"}
    prefectures_id  {"2"}
    city            {"東京"}
    block           {"東京"}
    tel_number      {"09008280828"}
  end
end
