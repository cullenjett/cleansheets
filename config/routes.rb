Rails.application.routes.draw do
  root to: 'pages#front'
  get 'ui(/:action)', controller: 'ui'

  resources :users, only: [:create, :show]
  
  get '/auth/:provider/callback' => 'authentications#create'
end
