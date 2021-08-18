FactoryBot.define do
  factory :line_food do
    count { 1 }
    association :food, :restaurant, :order
    # food { FactoryBot.create(:food) }
    # restaurant { FactoryBot.create(:restaurant) }
    # order { FactoryBot.create(:order) }
  end
end
