Rails.application.routes.draw do

  resources :members, only:[:index, :edit, :show, :update] do
    member do
      get :following, :followers
    end
  end

  resources :rooms
  resources :relationships, only: [:create, :destroy]

  devise_for :members ,controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations',
  }





 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
