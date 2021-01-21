FactoryBot.define do
  factory :item do
    item_name { 'sample' }
    description { 'sampleです' }
    price { 3000 }
    association :user
    category_id { 1 }
    condition_id { 1 }
    shipping_payer_id { 1 }
    shipping_date_id { 1 }
    prefecture_id { 1 }

  

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
