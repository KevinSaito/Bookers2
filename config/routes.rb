Rails.application.routes.draw do

  get 'post_image/new'
  get 'post_image/index'
  get 'post_image/show'
  root to: "homes#top"
  devise_for :users

  resources :books, only:[:create, :show, :index, :edit]

  resources :post_image, only:[:new, :show, :index]

  resources :users, only:[:update, :show, :index, :edit]


  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
