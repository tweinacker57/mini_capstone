class Api::ProductsController < ApplicationController
  def all
    @products = Product.all
    render "products.json.jb"
  end
end
