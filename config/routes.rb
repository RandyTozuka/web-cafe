Rails.application.routes.draw do
  get 'menus/new'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'static_pages#home'
  get 'static_pages/menu'
  get 'static_pages/contact'
  get 'static_pages/show'
  resources :menus # devise_for :users
  resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
