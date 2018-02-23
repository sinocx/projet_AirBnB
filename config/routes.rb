Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :new, :create, :destroy, :update, :edit]
  resources :products, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  get '/bookings/:id/destroy', to: "bookings#destroy", as:  "destroy_booking"
  get '/dashboards' , to: "dashboards#dashboard"
  get '/dashboards/bookings/:id' , to: "bookings#validate", as: "validate_booking"
  get '/dashboards/bookings/:id/refuse' , to: "bookings#refuse", as: "refuse_booking"

end
