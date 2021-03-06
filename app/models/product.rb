class Product < ApplicationRecord 
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: {in: 2..200}
  validates :image_url, uniqueness: true
  validates :price, numericality: {greater_than: 0}

  belongs_to :supplier 
  has_many :carted_products
  has_many :orders, through: :carted_products
 
  # has_many :product_catagories
  # has_many :catagories, through: :product_catagories
  # come back to this
 

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
