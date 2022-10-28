Rails.application.routes.draw do
  devise_for :users
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  

  resources :pines do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  
end


  resources :pinehomes, only: [:index, :about]
  resources :users ,only: [:show] # ユーザーマイページへのルーティング

  root 'pinehomes#index'

  get 'pinehomes/about' => 'pinehomes#about'

  




  

end
