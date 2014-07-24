require "rails_helper"

describe "show items in clearance_batch" do

  describe "items index", type: :feature do

    describe "see items" do
      let!(:clearance_batch) { FactoryGirl.create(:clearance_batch) }

      before do
        @item1 =  FactoryGirl.create(:item, size: "M", color: "White", status: "clearanced", sold_at: 8, style: FactoryGirl.create(:style, type: "Top"))
        @item2 =  FactoryGirl.create(:item, size: "L", color: "Red", status: "clearanced", sold_at: 9, style: FactoryGirl.create(:style, type: "Scarf")) 
        clearance_batch.items << @item1
        clearance_batch.items << @item2
      end

      it "displays a list of all past clearance batches" do
        visit "/clearance_batches/#{clearance_batch.id}/items"
        expect(page).to have_content("Stitch Fix Clearance Tool")
        expect(page).to have_content("Items in Clearance Batch #{clearance_batch.id}")
        within('table.items') do
          expect(page).to have_content("Item #{@item1.id}")
          expect(page).to have_content("Item #{@item2.id}")
          expect(page).to have_content(@item1.size)
          expect(page).to have_content(@item2.size)
          expect(page).to have_content(@item1.color)
          expect(page).to have_content(@item2.color) 
          expect(page).to have_content(@item1.status)
          expect(page).to have_content(@item2.status)
          expect(page).to have_content(@item1.sold_at)
          expect(page).to have_content(@item2.sold_at)
          expect(page).to have_content(@item1.style.type)
          expect(page).to have_content(@item2.style.type)
        end
      end

    end

  end
end

