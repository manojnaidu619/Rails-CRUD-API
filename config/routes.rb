Rails.application.routes.draw do
  devise_for :users
  root 'clients#index'
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :users
    end
  end
end
