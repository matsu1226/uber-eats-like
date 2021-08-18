require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { FactoryBot.create(:restaurant) }
  subject { restaurant }

  it { should be_valid }

  describe "アソシエーションのテスト" do
    it { should respond_to(:foods)}
    it { should respond_to(:line_foods)}
  end

  describe "バリデーションのテスト" do
    context "空欄で無効になることをテスト" do      
      it "名前" do
        restaurant.name = ''
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include("Name can't be blank")
      end

      it "手数料" do
        restaurant.fee = ""
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include("Fee can't be blank")
      end

      it "時間" do
        restaurant.time_required = ""
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include("Time required can't be blank")
      end
    end

    context "その他のテスト" do
      it "名前が30文字以下でないと無効であることをテスト"do
        restaurant.name = "a" * 31
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include("Name is too long (maximum is 30 characters)")
      end

      it "手数料が0円以上でないと無効であることをテスト"do
        restaurant.fee = 0
        restaurant.valid?
        expect(restaurant.errors.full_messages).to include("Fee must be greater than 0")
      end
    end

  end
end
