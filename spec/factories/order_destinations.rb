FactoryBot.define do
  factory :order_destination do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東区' }
    address { '香椎' }
    building_name {'テリハ'}
    phone_number {'12345678909'}
  end
end