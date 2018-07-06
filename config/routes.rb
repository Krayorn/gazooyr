Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'gazooies#index'
  resources :gazooies, :only => [:index, :show, :create]
  resources :comments, :only => [:create]
  resources :hash_tags, :only => [:show]
  resources :news
  

  resources :profiles, :except => [:destroy, :new, :index, :create] do
    post "follow/:user_id", :to => "profiles#follow"
    delete "unfollow/:user_id", :to => "profiles#unfollow"
    get "followers/", :to => "profiles#followers"
    get "followees/", :to => "profiles#followees"
    get "mentions/", :to => "profiles#mentions"
  end

  resources :pages, :except => [:index] 
  get '/super-page' => 'pages#show',  id: 'super-page'
  get '/:id' => 'pages#show'

end
