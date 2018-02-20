Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :new, :create, :destroy, :update, :edit]
  resources :products, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
  end

  get '/dashboards' , to: "dashboards#rental"
  get '/dashboards' , to: "dashboards#offer"
end
