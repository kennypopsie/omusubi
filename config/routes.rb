Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #Channel Controller
  get 'channel/new', to: 'channel#new', as: 'new_channel'

end
