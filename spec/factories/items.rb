FactoryBot.define do
  factory :item do
    item_name { '商品' }
    price { 1000 }
    description { '説明' }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    day_id { 2 }
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
    association :user
  end
end
