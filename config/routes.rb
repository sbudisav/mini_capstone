Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/single_product_url" => 'products#single_product_action'
    get "/many_products_url" => 'products#many_products_action'

  end
end
