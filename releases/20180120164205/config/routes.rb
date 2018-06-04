Rails.application.routes.draw do
  resources :blogs
  resources :firmware_images
  resources :wines
  resources :grapes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sessions/new'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'index#home'
  get '/about', to: 'index#about', as: 'about'
  get '/grow', to: 'index#grow', as: 'grow'
  get '/contact', to: 'index#contact', as: 'contact'
  get '/top-:category/:company', to: 'index#place', as: 'place'
  get '/top-:category', to: 'index#ranking', as: 'ranking'
  get '/search', to: 'index#search', as: 'search'
  get '/shareup/:id', to: 'index#share_up', as: 'shareup'
  get '/likeup/:id', to: 'index#like_up', as: 'likeup'
  get '/wines', to: 'wines#index'
  get '/wine_week', to: 'wines#week'
  get '/grape_week', to: 'grapes#week'
  get '/groups', to: 'groups#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
   resources :users
  
  scope 'admin' do
    resources :companies
  end

  root 'index#home'

end
