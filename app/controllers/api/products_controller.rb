class Api::ProductsController < ApplicationController
  def all
    @products = Product.all
    render "products.json.jb"
  end

  def query
    @message = "hello"
    render "search.json.jb"
  end
end
