Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  patch 'all_links/', to: 'api/v1/links#index'
  post 'create_link/', to: 'api/v1/links#create'
  get 'show_link/', to: 'api/v1/links#show_link'
  get '/get/alexa_rank', to: 'api/v1/links#alexa_rank'
  
  #namespace :api do
  #  namespace :v1 do
  #    resources :links
  #  end
  #end
end
