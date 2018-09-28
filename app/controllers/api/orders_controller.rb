class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]



  def index
    @orders = Order.all
    render 'index.json.jbuilder'
  end


  def create 

    @all_carted_products = CartedProduct.where(user_id: current_user.id)
    @subtotal = 0
    @all_carted_products.each do |carted_index|
      @subtotal += (carted_index.product.price * carted_index.quantity)
      carted_index.status = "purchased"
    end

    @tax = (@subtotal * 0.08)
    @total = (@subtotal + @tax)

    @order = Order.new(user_id: current_user.id)

    if @order.save
      render "_order.json.jbuilder"
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
