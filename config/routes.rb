Rails.application.routes.draw do  
  get 'comment/new'
  get 'posts/index'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create]  do
      member do 
        post 'increment_likes'
      end
      resources :comments, only: [:new, :create]          
    end
  end  
  get '/users/:user_id/posts/:id/increment_likes', to: 'posts#increment_likes'
  # get '/users/:user_id/posts/:id/new', to: 'comment#new'
  get '/users/:user_id/posts/:id/new_comment', to: 'comments#new', as: 'new_comment'

end
