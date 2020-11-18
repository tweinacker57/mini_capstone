class Product < ApplicationRecord
  validates :name, :price, :description, :inventory, presence: true
  validates :description, length: { in: 10..500 }
  validates :price, numericality: { greater_than: 0 }
  belongs_to :supplier
  has_many :images
  
  # def supplier
  #   Supplier.find_by(id: supplier_id)  
  # end

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
