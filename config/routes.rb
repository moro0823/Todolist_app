Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only:[:show,:create] 

  resources :to_dos do
    collection do
     get 'search'
    end
  end
  
end
