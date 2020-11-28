Rails.application.routes.draw do

  root to: 'homes#home'
  get 'homes/about' => 'homes#about'
  get '/search' => 'searches#search'

   devise_for :members ,controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions'
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
  resources :chats, only: [:create, :show]
  
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
