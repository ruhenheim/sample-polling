Rails.application.routes.draw do
  root to: 'pages#home'

  resources :posts, only: [:show]
  post 'polling_start', to: 'hoges#start'
  get  'fetch', to: 'hoges#fetch'
end
