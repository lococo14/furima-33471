FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    prefecture_id { 1 }
    city { '横浜市' }
    street_name { '1-1' }
    building_name { 'パークハイツ102' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
