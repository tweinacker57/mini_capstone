class Api::ProductsController < ApplicationController
  def index
    search_term = params[:search]
    if search_term
      @products = Product.where("name ILIKE '%#{search_term}%'")
    else
      @products = Product.all
    end
    render 'index.json.jb'
  end

  def show
    id = params[:id]
    @product = Product.find_by(id: id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:input_name], 
      price: params[:input_price], 
      image_url: params[:input_image_url], 
      description: params[:input_description]
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    @product.save
      render 'show.json.jb'
    # else
    #   render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    # end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product has been removed"}
  end
end
