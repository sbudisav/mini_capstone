  json.id product.id
  json.name product.name
  json.price product.price
  json.tax product.tax
  json.total product.total
  json.is_discounted product.is_discounted
  json.image_url product.image_url
  json.description product.description
  json.stock product.stock
  json.is_instock product.is_instock
  json.supplier_id product.supplier_id
  json.link "http://localhost:3000/api/products/#{product.id}"

  json.formatted do 
    json.price number_to_currency(product.price)
    json.tax number_to_currency(product.tax)
    json.total number_to_currency(product.total)
  end

  json.supplier do 
    json.partial! product.supplier, partial: 'supplier', as: :supplier
  end