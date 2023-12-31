Rails.application.routes.draw do
  devise_for :users#, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #Channel Controller

  #channels controller
  get 'channels/new', to: 'channels#new', as: 'new_channel'
  post 'channels/new', to: 'channels#create', as: 'create_channel'
  get '/', to: 'channels#index', as: 'index_channel'

 
  get '/channels/:id', to: 'channels#show', as: 'channel'
  get 'channels/edit/:id', to: 'channels#edit', as: 'edit_channel'
  post 'channels/edit/:id', to: 'channels#update', as: 'update_channel'
  delete 'channels/destroy/:id', to: 'channels#destroy', as: 'destroy_channel'
  
  
  # CommentsController
  post 'comments/:id', to: 'comments#create', as: 'create_comment'
  patch 'comments/:id', to: 'comments#update', as: 'update_comment'
  delete 'comments/:id', to: 'comments#destroy', as: 'destroy_comment'
 
  get 'users/show', to: 'users#show', as: 'show_user'
  
  get 'replies/show', to: 'replies#show', as: 'show_reply'
  get 'replies/:id', to: 'replies#new', as: 'new_reply'
  post 'replies/:id', to: 'replies#create', as: 'create_reply'
  patch 'replies/:id', to: 'replies#update', as: 'update_reply'
  delete 'replies/:id', to: 'replies#destroy', as: 'destroy_reply'
  
  
  # get 'studies/index', 'studies#index', as: 'index_study'
  # get 'studies/:id', 'studies#new', as: 'new_study'
  # post 'studies/:id', 'studies#create', as: 'create_study'
  # patch 'studies/:id', 'studies#update', as: 'update_study'
  
  resources :studies
  
  resources :comments do
     resource :favorites, only: [:create, :destroy]
  end

end
