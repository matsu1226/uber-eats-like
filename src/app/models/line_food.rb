class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }
  # scope => モデルそのものや関連するオブジェクトに対するクエリを指定。
  # 今回は　line_food_instance.active 
  scope :other_restaurant, -> (picked_restaurant_id){ where.not(restaurant_id: picked_restaurant_id) }
  # 今回は　line_food_instance.other_restaurant(picked_restaurant_id)
  def total_amount
    food.price * count
  end
end