class Order < ApplicationRecord
  # validates :product_id, :user_id, :price, :quantity, :subtotal, :tax, :total
  belongs_to :user
  belongs_to :product
  has_many :carted_products

  
#   def subtotal
#     quantity * price
#   end

#   def tax
#     subtotal * 0.09
#   end

#   def total
#     subtotal + tax
#   end
# end
