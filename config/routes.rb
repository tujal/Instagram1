Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
    resources :users do
      resources :posts
    end
      resources :users do
        resources :posts do
            resources :comments
        end
      end

      resources :posts do
        resources :likes
      end
    get 'users/:id', to: 'users#show', as: 'user_profile'
    get 'users/:id/index', to: 'users#index'

    get '/search', to: "posts#search"
end
