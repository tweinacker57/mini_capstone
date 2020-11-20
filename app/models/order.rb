class Order < ApplicationRecord
  # validates :product_id, :user_id, :price, :quantity, :subtotal, :tax, :total
  belongs_to :user
  belongs_to :product
end
