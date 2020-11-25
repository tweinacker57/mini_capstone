class Api::CartedProductsController < ApplicationController

  def create
    if current_user
      @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "In Cart")
      @carted_product.save
      render "show.json.jb"
    else
      render json: "Product not carted"
    end
  end

  def index
    render "index.json.jb"
  end
end
