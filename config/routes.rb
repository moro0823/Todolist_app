Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only:[:show,:create]
  resources :to_dos
end
