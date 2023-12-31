Rails.application.routes.draw do

  root to: "homes#top"
  get "home/about" => "homes#about", as: "homes_about"

  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show, :index] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
