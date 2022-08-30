Rails.application.routes.draw do
  
  
  namespace :public do
    resources :posts, only: [:index, :new, :create, :show, :destory]
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
