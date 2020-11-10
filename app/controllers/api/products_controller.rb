class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:input_name], 
      price: params[:input_price], 
      image_url: params[:input_image_url], 
      description: params[:input_description]
    )
    @product.save
    render 'show.json.jb'
  end

  def update
    @product = Product.find_by(id: 4)
    @product.name = "Record Player"
    @product.price = 75
    @product.image_url = ""
    @product.description = "Play all your favorite records"
    render 'show.json.jb'
  end
end
