class Style < ActiveRecord::Base

  self.inheritance_column = :_type_disabled
  has_many :items

  def dress
    "Dress"
  end

  def pants
    "Pants"
  end

  def dress?
    type == dress
  end

  def pants?
    type == pants
  end

end
