FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.jpg'), 'image/jpeg') }
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 300..9_999_999) }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_burden_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    user { FactoryBot.create(:user) }
  end
end
