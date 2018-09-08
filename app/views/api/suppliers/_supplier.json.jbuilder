json.id supplier.id
json.name supplier.name
json.email supplier.email
json.phone_number supplier.phone_number
json.link "http://localhost:3000/api/supplier/#{supplier.id}"
  # json.supplier do 
  #   json.partial! product.supplier, partial: 'supplier', as: :supplier
  # end        trying to get the suppliers to display all of their products