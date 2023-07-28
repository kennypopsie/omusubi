Rails.application.routes.draw do
  devise_for :users#, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #Channel Controller
  get '/', to: 'channel#new', as: 'new_channel'
  

  get 'users/show', to: 'users#show', as: 'show_user'

end
