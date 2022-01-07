Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "item#index"

  get "/itens", to: "item#index"
  post "/itens/create", to: "item#create"
  post "/itens/multiple_creation", to: "item#bulk_create"
  patch "/itens/check/:id", to: "item#check"
end
