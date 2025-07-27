Rails.application.routes.draw do
  root to: 'landing#index'
  devise_for :users
  resources :menu_items do
    post 'add_to_daily_menu', on: :member
  end
  resources :ingredients
  resources :daily_menus
  resources :daily_menu_items
  resources :grocery_lists do
    member do
      get :pdf
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check

end
