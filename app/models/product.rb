class Product < ApplicationRecord
  validates :name, :price, :description, :image_url, :inventory, presence: true
  validates :description, length: { in: 10..500 }
  validates :price, 
  
  def tax
    price * 0.09
  end
  
  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end 

  def total
    price + tax
  end
end
