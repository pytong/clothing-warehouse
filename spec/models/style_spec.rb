require 'rails_helper'

describe Style do

  describe "#dress?" do
    context "type is dress" do
      let(:style) { FactoryGirl.create(:style, type: "Dress") }
      it "should return true" do
        expect(style.dress?).to eq(true)
      end      
    end

    context "type is not dress" do
      let(:style) { FactoryGirl.create(:style, type: "Sweater") }
      it "should return false" do
        expect(style.dress?).to eq(false)
      end
    end
  end

  describe "#pants?" do
    context "type is pants" do
      let(:style) { FactoryGirl.create(:style, type: "Pants") }
      it "should return true" do
        expect(style.pants?).to eq(true)
      end      
    end

    context "type is not pants" do
      let(:style) { FactoryGirl.create(:style, type: "Top") }
      it "should return false" do
        expect(style.pants?).to eq(false)
      end
    end
  end

end
