class Product < ApplicationRecord
  def tax
    price * 0.08
  end

  def total
    price + tax
  end

  def is_discounted
    price < 100
  end

  def is_instock
    stock > 0
  end

end
