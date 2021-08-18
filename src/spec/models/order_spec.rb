require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) {FactoryBot.create(:order)}

  subject { order }

  it { should be_valid }

  describe "アソシエーションのテスト" do
    it { should respond_to(:line_foods)}
  end

  describe "バリデーションのテスト" do
    describe "合計額が0円以上でないと無効であることをテスト" do
      before { order.total_price = 0 }
      it { should_not be_valid }
    end
  end

  # describe "メソッドのテスト" do
  #   describe "save_with_update_line_foods!(line_foods)のテスト" do
  #     let(:line_foods) { FactoryBot.create_list(:line_food, 3) }
  #     # let(:line_food) { FactoryBot.create(:line_food) }
  #     it { expect(order.save_with_update_line_foods!(line_foods)).to change(order, :count).by(1) }
  #   end
  # end

end
