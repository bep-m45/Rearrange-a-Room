Rails.application.routes.draw do
 
  root to: 'homes#home'
  get 'homes/about' => 'homes#about'
  
   devise_for :members ,controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions'
  }
   resources :members, only: [:edit, :show, :index, :update, :new] do
         member do
           get :following,:followers
         end
       end
  
   
       
  resources :rooms
  resources :relationships, only: [:create, :destroy]

 






 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
