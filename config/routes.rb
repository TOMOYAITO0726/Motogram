Rails.application.routes.draw do
  
  namespace :admin do 
   resources :posts, only: [:index, :show,]
   resources :users, only: [:index, :show, :edit, :update]
  end   
  
  namespace :public do
    resources :posts, only: [:index, :new, :create, :show, :destroy]do 
      resource  :favorites, only: [:create, :destroy]
      resources  :comments, only: [:create, :show]
    end 
    resources :users do
      resource :relationships, only: [:create, :destroy]
        get :favorites,on: :member
        get :follows, on: :member
        get :followers, on: :member
    end   
    
    resources :notifications, only: :index
    get "search" => "searches#search"
  end  
  
  
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords] , controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
