Rails.application.routes.draw do

  get '/', to: 'root#hello_world'

  get '/reports', to: 'posts#index'

  get '/reports/:id', to: 'posts#show'

  get '/reports/new', to: 'posts#new'

  post '/reports', to: 'posts#create'

  get '/reports/:id/edit', to: 'posts#edit'

  put '/reports/:id', to: 'posts#update'

  delete '/reports/:id', to: 'posts#destroy'

  resources :reports
end
