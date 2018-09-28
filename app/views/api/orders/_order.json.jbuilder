json.user_id @order.user_id
json.name @order.user.name
json.items @all_carted_products
json.subtotal @subtotal
json.tax @tax
json.total @total


=begin

everything here goes in the show json 
json.product do 
json.partial! @order.product, partial: 'api/products/product', as: :product
end
json.quantity @order.quantity
json.user_email @order.user.email (returns the user object associated with this specific order)  

=end