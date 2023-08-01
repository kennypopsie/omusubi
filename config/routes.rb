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

 
  get 'channels/edit/:id', to: 'channels#edit', as: 'edit_channel'
  post 'channels/edit/:id', to: 'channels#update', as: 'update_channel'
  delete 'channels/destroy/:id', to: 'channels#destroy', as: 'destroy_channel'

  get 'users/show', to: 'users#show', as: 'show_user'
  
    # ここから追加
  # CommentsController
  get 'channels/show/:post_id/comments/new', to: 'comments#new', as: 'new_comment'
  post 'channels/show/:post_id/comments/new', to: 'comments#create', as: 'create_comment'
  # ここまで


end
