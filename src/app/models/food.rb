class Food < ApplicationRecord
  belongs_to :restaurant  # Foodはrestaurant_idを持っている 
  belongs_to :order, optional: true   # optional: true=> 外部キーのnilを許可
  has_one :line_food # Foodはline_foods_id持ってないが、Line_foodはfood_idを持つ。
end

# belongs_to,has_oneで追加されるメソッド
# https://railsguides.jp/association_basics.html#belongs-to%E3%81%A7%E8%BF%BD%E5%8A%A0%E3%81%95%E3%82%8C%E3%82%8B%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89
# ex) class Food { has_one :line_foods } end
# food.line_foods
# food.build_line_foods(restaurant_id: ~ ,count: ~)
# food.create_line_foods(restaurant_id: ~ ,count: ~)
# food.create_line_foods!(restaurant_id: ~ ,count: ~)
# food.reload_line_foods

