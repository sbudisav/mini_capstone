json.array! @products.each do |product|

  json.id product.id
  json.name product.name
  json.price product.price
  json.image_url product.image_url
  json.description product.description
  json.link "http://localhost:3000/api/products/#{product.id}"
end