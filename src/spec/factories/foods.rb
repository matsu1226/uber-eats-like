FactoryBot.define do
  factory :food do
    sequence(:name)   { |n| "Food_#{n}"}
    price { 500 }
    description { "商品説明" }

    association :restaurant, :order
  end
end
