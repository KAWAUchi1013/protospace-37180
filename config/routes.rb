Rails.application.routes.draw do
  # get 'prototyepwss/index'
  devise_for :users
  # resources :tweets, only: :index
  # prototypesコントローラーのルーティングの指定
  # トップページの指定　root_toの設定
  root to: "prototypes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :prototypes do
      resources :comments 
    end
    resources :users, only: :show
  
end
