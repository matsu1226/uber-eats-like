FactoryBot.define do
  factory :order do
    total_price { 1600 }
    # line_foods {[
    #   FactoryBot.build(:line_food)
    #   ]}
    end
end
