Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create 
    delete 'logout' => :destroy
  end
  #get 'sessions/create'
  #get 'sessions/destroy'
  resources :users
  get 'home' => 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
