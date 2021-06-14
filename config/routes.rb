Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/plots', to: 'plots#index'
  delete '/plots/:plot_id/:plant_id', to: 'plots#destroy'
  get '/gardens', to: 'gardens#show'
end
