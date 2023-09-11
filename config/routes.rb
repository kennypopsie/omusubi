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
  # CommentsController
  post 'comments/:id', to: 'comments#create', as: 'create_comment'
  patch 'comments/:id', to: 'comments#update', as: 'update_comment'
  delete 'comments/:id', to: 'comments#destroy', as: 'destroy_comment'
 
 
  get 'channels/edit/:id', to: 'channels#edit', as: 'edit_channel'
  post 'channels/edit/:id', to: 'channels#update', as: 'update_channel'
  delete 'channels/destroy/:id', to: 'channels#destroy', as: 'destroy_channel'

  get 'users/show', to: 'users#show', as: 'show_user'
  
  get 'replies/show', to: 'replies#show', as: 'show_reply'
  get 'replies/:id', to: 'replies#new', as: 'new_reply'
  post 'replies/:id', to: 'replies#create', as: 'create_reply'
  patch 'replies/:id', to: 'replies#update', as: 'update_reply'
  delete 'replies/:id', to: 'replies#destroy', as: 'destroy_reply'
  
  # post 'comments/comment_id/favorites/:id', to: 'favorites#create', as: 'create_favorite'
  # delete 'comments/comment_id/favorites/:id', to: 'favorite#destroy', as: 'destroy_favorite'
  
  # post_favorites POST   /posts/:post_id/favorites(.:format)      favorites#create
  # post_favorite DELETE  /posts/:post_id/favorites/:id(.:format)  favorites#destroy
  
  
  resources :comments do
     resource :favorites, only: [:create, :destroy]
  end
  
    # ここから追加
  # CommentsController
  # get 'channels/show/:post_id/comments/new', to: 'comments#new', as: 'new_comment'
  # post 'channels/show/:post_id/comments/new', to: 'comments#create', as: 'create_comment'
  # get 'channels/show/:post_id/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  # post 'channels/show/:post_id/comments/:id/edit', to: 'comments#update', as: 'update_comment'
  # delete 'channels/show/:post_id/comments/destroy/:id', to: 'comments#destroy', as: 'destroy_comment'

end
