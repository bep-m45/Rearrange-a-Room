Rails.application.routes.draw do


  resource :members, only:[:index, :edit, :show, :update]

  devise_for :members ,controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations',
  }



 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
