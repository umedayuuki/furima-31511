FactoryBot.define do
  factory :purchase_shipping_address do
    postalcode { "514-0101" }
    munitipalities{ "津市" }
    address{ "一身田平野513−３" }
    area_id { 2 }
    phonenumber { "08089760877" }
    building_name{ "イリーデ" }
    token { "token" }
  end
end