class Api::ProductsController < ApplicationController
    def single_product_action
    @product = Product.first
    render 'single_product.json.jbuilder'
  end

  def many_products_action
    @products = Product.all
    render 'many_products.json.jbuilder'
  end
end
