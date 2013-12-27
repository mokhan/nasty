require "spec_helper"

module Nasty
  describe IdentityMap do
    let(:sut) { IdentityMap.new }

    context "when an item is added" do
      let(:item) { Item.new(:id => 187) }

      before { sut.add(item) }

      it "indicates that an item with that id is available" do
        sut.has_item_for?(item.id).should be_true
      end

      it "loads the item" do
        sut.item_for(item.id).should == item
      end

      context "when an item is evicted" do
        before { sut.evict(item) }

        it "indicates that it does not have an item for the evicted id" do
          sut.has_item_for?(item.id).should be_false
        end

        it "returns nothing" do
          sut.item_for(item.id).should be_nil
        end
      end
    end

    context "when no items have been added" do
      it "indicates that it does not have any items for any id" do
        (0..10).each do |i|
          sut.has_item_for?(i).should be_false
        end
      end
    end

    class Item
      attr_reader :id

      def initialize(attributes)
        @id = attributes[:id]
      end
    end
  end
end
