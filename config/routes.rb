Rails.application.routes.draw do


  get 'member/index'
  get 'member/show'
  get 'member/edit'
  root to: 'homes#home'
  get '/homes/about' => 'homes#about'
  get '/search' => 'searches#search'
  get '/members/resign' => 'members#resign'
  patch 'members/resign' => 'members#resign_update'
  resources :admins, only: [:index] 
    
    devise_scope :member do
    post 'members/guest_sign_in', to: 'members/sessions#new_guest'
    end
    
    devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admins/sessions#new_guest'
    end
    
    devise_for :members ,controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions'
  }
   devise_for :admins  ,controllers: {
    sessions: 'admins/sessions'
  }
    
  resources :members, only: [:edit, :show, :index, :update, :new] do
         member do
           get :following,:followers
         end
       end
   resources :rooms do
   resource :favorites, only: [:create, :destroy]
   resources :room_comments, only: [:create, :destroy] 
  end      
   resources :relationships, only: [:create, :destroy]
   resources :messages, only: [:create]
   resources :chats, only: [:create, :show, :index]   
   
 

 


  
  namespace :admins do
   resources :members
   resources :rooms
   resources :room_comments, only: [:destroy]
  end


 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end