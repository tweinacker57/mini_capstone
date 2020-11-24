class Api::OrdersController < ApplicationController

  def create
    subtotal = params[:quantity] *

    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: quantity * @product.price
      )
      @order.save
      render "show.json.jb"
    else
      render json: ["Order not successfully placed"]
    end
  end
end
