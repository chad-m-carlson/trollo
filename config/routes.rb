Rails.application.routes.draw do
  root "work_orders#index"
  
  devise_for :users
  resources :work_orders do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end
end
