Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/plants', to: 'plants#index'
  get '/gardens', to: 'gardens#show'
end
