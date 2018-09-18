Rails.application.routes.draw do 
  namespace :api do
    get "/products" => 'products#index'
    post "/products" => 'products#create'
    get "/products/:id" => 'products#show'
    patch "/products/:id" => 'products#update'
    delete "/products/:id" => 'products#destroy'

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    post "/orders" => "orders#create"

    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'

    get "/suppliers" => 'suppliers#index'
    post "/suppliers" => 'suppliers#create'
    get "/suppliers/:id" => 'suppliers#show'
    patch "/suppliers/:id" => 'suppliers#update'
    delete "/suppliers/:id" => 'suppliers#destroy'
  end
end
