Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'meetings#index'

  resources :meetings, only: %I[index create update destroy] do
    member do
      patch :toggle_enable_status
    end
  end
end
