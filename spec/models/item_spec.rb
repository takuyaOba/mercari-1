require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("translation missing: ja.activerecord.errors.models.item.attributes.name.blank")
    end

    it "itemsモデルに関するテストを書く" do
      item = Item.new(description: "")
      item.valid?
      expect(item.errors[:description]).to include("translation missing: ja.activerecord.errors.models.item.attributes.description.blank")
    end

    it "is invalid without a first_category_id" do
      item = build(:item, first_category_id: "")
      item.valid?
      expect(item.errors[:first_category_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.first_category_id.blank")
    end

    it "is invalid without a second_category_id" do
      item = build(:item, second_category_id: "")
      item.valid?
      expect(item.errors[:second_category_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.second_category_id.blank")
    end

    it "is invalid without a third_category_id" do
      item = build(:item, third_category_id: "")
      item.valid?
      expect(item.errors[:third_category_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.third_category_id.blank")
    end

    it "is invalid without a shipping_price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("translation missing: ja.activerecord.errors.models.item.attributes.price.blank")
    end

  end
end  