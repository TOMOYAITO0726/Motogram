Rails.application.routes.draw do
  
  namespace :admin do 
   resources :posts, only: [:index, :show, :destroy]
   resources :users, only: [:index, :show, :edit, :update]
   get "search" => "searches#search"
  end   
  
  namespace :public do
    resources :posts, only: [:index, :new, :create, :show, :destroy]do 
      resource  :favorites, only: [:create, :destroy]
      resources  :comments, only: [:create, :show, :destroy]
    end 
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get :favorites,on: :member
      get :follows, on: :member
      get :followers, on: :member
      member do
       get :profile
       patch :profile, to: :update, controller: 'users'
       get :following_posts
      end  
    end   
    
    resources :notifications, only: :index
    get "search" => "searches#search"
    #get "about" => "homes#about"
  end  
  
  
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords] , controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 以下を追加
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  root to: "homes#top"
  get "about" => "homes#about"
end
