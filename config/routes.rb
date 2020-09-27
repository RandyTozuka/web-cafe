Rails.application.routes.draw do
  get 'menus/new'
  root 'static_pages#home'
  get 'static_pages/menu'
  get 'static_pages/contact'
  get 'static_pages/news'
  devise_for :users
  resources :menus
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
