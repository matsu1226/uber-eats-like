class Food < ApplicationRecord
  belongs_to :restaurant  # Foodはrestaurant_idを持っている 
  belongs_to :order, optional: true   # optional: true=> 外部キーのnilを許可
  has_one :line_foods # Foodはline_foods_id持ってないが、Line_foodはfood_idを持つ。
end