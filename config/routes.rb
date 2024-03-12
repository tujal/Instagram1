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
    get 'users/:id', to: 'users#show', as: 'user_profile'
    
end
