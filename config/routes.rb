Rails.application.routes.draw do

  root 'statics#home'

  resources :messages

  post '/messages/new' => 'messages#new'

  resources :animals
  resources :comments
  resources :posts do
    put :interest, on: :member
  end
  resources :reports
  resources :users
  resources :articles

  get '/articles/:id/mementos', to: 'articles#mementos', as: :mementos
  post 'recover/:memento_id', to: 'articles#recover', as: :recover
  get 'users/:id/my_articles', to: 'users#my_articles', as: :my_articles

  get 'users/:id/interest_list' => 'users#interest_list', as: :user_interested_post
  get '/users/:id/report_user' => 'users#report_user', as: :report_user
  get '/users/:id/report_list' => 'users#report_list', as: :reports_list
  post '/reported' => 'users#reported'
  post '/posts/:id/adopt', to: 'users#adopt', as: :adopt
  get '/posts/:id/comment_post', to: 'posts#comment_post', as: :comment_post
  post '/create_comment', to:'posts#create_comment', as: :create_comment

  get '/new_post' => 'users#new_post', as: :new_user_post
  post '/create_post' => 'users#create_post', as: :create_user_post

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
	get '/search_by_kind' => 'posts#search_by_kind'

  get '/notifications' => 'notifications#index'

end
