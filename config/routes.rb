Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/cocktails/:id', to: 'pages#show', as: 'cocktail'
  get '/cocktails/', to:'pages#index', as: 'cocktail_index' 
end
