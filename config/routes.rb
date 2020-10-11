Rails.application.routes.draw do
  root to: 'pages#home'

  get '/cocktails/:id', to: 'pages#show', as: 'cocktail'
  get '/cocktails/', to:'pages#index', as: 'cocktail_index' 
end
