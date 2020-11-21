Rails.application.routes.draw do
  root to: 'homes#home'
  get 'homes/about' => 'homes#about'

  
   devise_for :members ,controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }
  resources :rooms
  resources :relationships, only: [:create, :destroy]

 
  resources :members, only:[:index, :edit, :show, :update]  do
         member do
           get :following,:followers
         end
       end




 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
