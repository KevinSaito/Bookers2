Rails.application.routes.draw do
  get 'homes/top'
  root to: "homes#top"
  devise_for :users
  
  resources :users,only[:show, :index, :edit]
  
  resources :books,only[:show, :index, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
