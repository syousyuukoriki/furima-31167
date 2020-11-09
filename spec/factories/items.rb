FactoryBot.define do
  factory :item do
    item_name           { 'カメラ' }
    introduction        { 'カメラです' }
    category_id         { 2 }
    item_condition_id   { 2 }
    price               { 300 }
    shipping_cost_id    { 2 }
    area_id             { 1 }
    days_id             { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
