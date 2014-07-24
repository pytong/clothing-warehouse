class Style < ActiveRecord::Base

  self.inheritance_column = :_type_disabled
  has_many :items

  def dress?
    type == "Dress"
  end

  def pants?
    type == "Pants"
  end

end
