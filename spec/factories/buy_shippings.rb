FactoryBot.define do
  factory :buy_shipping do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '富山市' }
    address { '1-2-3' }
    phone_number { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
