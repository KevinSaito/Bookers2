Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  get 'homes/about' => 'homes#about', as: 'about'


  resources :books, only:[:update, :create, :show, :index, :edit, :destroy]


  resources :users, only:[:update, :show, :index, :edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
