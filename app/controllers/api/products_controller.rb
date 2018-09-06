class Api::ProductsController < ApplicationController 
 
  def index
    @products = Product.all

    search_term = params[:search]
    if search_term 
      @products = @products.where(
                                  "name iLIKE ?",
                                  "%#{search_term}%"
                                  )
    end

  sorting_attribute = params[:sort]
  sorting_order = params[:order]

  if sorting_attribute && sorting_order
    @products = @products.order(sorting_attribute => sorting_order)
  elsif sorting_attribute
    @products = @products.order(sorting_attribute)
  end
    

    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
                            name:params[:name],
                            price:params[:price],
                            image_url:params[:image_url],
                            description:params[:description],
                            stock:params[:stock]                           
                            )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.stock = params[:stock] || @product.stock 
  
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end

end
  