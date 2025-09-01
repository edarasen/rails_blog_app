Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root "articles#index"

  resources :authors
  
  resources :articles do
    resources :comments
  end

  post '/authors/' => 'authors#create', as: 'create_author'
  post '/authors/:id' => 'authors#update', as:'update_author'
  delete '/authors/:id' => 'authors#destroy', as: 'destroy_author'

  post '/articles/' => 'articles#create', as: 'create_article'
  post '/articles/:id' => 'articles#update', as:'update_article'
  delete '/articles/:id' => 'articles#destroy', as: 'destroy_article'

  post '/articles/:article_id/comments/:id' => 'comments#update', as:'update_article_comment'
  delete '/articles/:article_id/comments/:id' => 'comments#destroy', as: 'destroy_article_comment'
end
