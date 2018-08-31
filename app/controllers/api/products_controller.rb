class Api::ProductsController < ApplicationController
 
  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end

  def show
    @products = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

end
  