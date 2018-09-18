class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: :[:index, :create]

  def index
    @orders = Order.all
    render 'index.json.jbuilder'
  end


  def create 

    @order = Order.new( 
                        product_id: params[:product_id],
                        quantity: params[:quantity],
                        user_id: current_user.id  
                        )
    product = Product.find_by(id: params[:product_id])
    #  this can be rewritten as 
    #  product = @order.product as an order can have many products 
    price = product.price
    @subtotal = price * (@order.quantity)
    # @order.subtotal if you want it to be a function of the order
    @tax = (@subtotal * 0.08)
    @total = (@subtotal + @tax)

    if @order.save
      render "_order.json.jbuilder"
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
