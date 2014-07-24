require 'rails_helper'

describe Item do
  describe "#perform_clearance!" do

    context "item is neither a dress nor pants" do
      let(:item) { FactoryGirl.create(:item, style: FactoryGirl.create(:style, type: "Top", wholesale_price: wholesale_price)) }
      before do
        item.clearance!
        item.reload
      end

      context "discounted price is high" do
        let(:wholesale_price) { 100 }
        it "should mark the item status as clearanced" do
          expect(item.status).to eq("clearanced")
        end

        it "should set the price_sold as 75% of the wholesale_price" do
          expect(item.price_sold).to eq(BigDecimal.new(wholesale_price) * BigDecimal.new("0.75"))
        end
      end

      context "discounted price is too low" do
        let(:wholesale_price) { 2.5 }
        it "should mark the item status as clearanced" do
          expect(item.status).to eq("clearanced")
        end

        it "should set the price_sold to 2" do
          expect(item.price_sold).to eq(BigDecimal.new("2"))
        end
      end
    end

    ["Dress", "Pants"].each do |style_type|
      context "item is #{style_type}" do
        let(:item) { FactoryGirl.create(:item, style: FactoryGirl.create(:style, type: style_type, wholesale_price: wholesale_price)) }
        before do
          item.clearance!
          item.reload
        end

        context "discounted price is high" do
          let(:wholesale_price) { 100 }
          it "should mark the item status as clearanced" do
            expect(item.status).to eq("clearanced")
          end

          it "should set the price_sold as 75% of the wholesale_price" do
            expect(item.price_sold).to eq(BigDecimal.new(wholesale_price) * BigDecimal.new("0.75"))
          end
        end

        context "discounted price is too low" do
          let(:wholesale_price) { 6 }
          it "should mark the item status as clearanced" do
            expect(item.status).to eq("clearanced")
          end

          it "should set the price sold to 5" do
            expect(item.price_sold).to eq(BigDecimal.new("5"))
          end
        end
      end
    end

  end
end
