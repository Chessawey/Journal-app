Rails.application.routes.draw do
  get 'category/index'
  resources :category
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")


  root 'category#index'
 
end
