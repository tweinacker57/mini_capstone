class Api::ProductsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  # before_action :authenticate_user, except: [:index, :show]

  
  def index

    p "current_user"
    p current_user
    p "/current_user"

    if params[:search]
      @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    
    if params[:sort] && params[:sort_order]
      @products = @products.order(params[:sort] => params[:sort_order])
    else 
      @products = @products.order(id: :asc)
    end

    if params[:discount] == "true"
      @products = @products.where("price < 15")
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
