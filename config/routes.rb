Rails.application.routes.draw do
  resources :powers
  resources :heroines 

  post '/search', to: 'heroines#search'
end

