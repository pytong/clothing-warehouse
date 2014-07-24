class Item < ActiveRecord::Base

  CLEARANCE_PRICE_PERCENTAGE  = BigDecimal.new("0.75")
  MIN_PRICE = BigDecimal.new("2")
  MIN_DRESS_AND_PANTS_PRICE = BigDecimal.new("5")

  belongs_to :style
  belongs_to :clearance_batch

  scope :sellable, -> { where(status: 'sellable') }

  def clearance!
    update_attributes!(status: 'clearanced', price_sold: clearance_price)
  end

  def self.statuses
    Item.select(:status).uniq.map{|s| s.status}
  end
 
  private

  def clearance_price
    potential_clearance_price = style.wholesale_price * CLEARANCE_PRICE_PERCENTAGE

    if style.dress? || style.pants?
      [potential_clearance_price, MIN_DRESS_AND_PANTS_PRICE].max
    else
      [potential_clearance_price, MIN_PRICE].max
    end
  end

end