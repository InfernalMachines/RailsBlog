Rails.application.routes.draw do
get 'users/new'
get 'posts/new'
get '/' => 'home#index'
get "/log-in" => "sessions#new"
post "/log-in" => "sessions#create"
get "/log-out" => "sessions#destroy", as: :log_out
get "/show" => "posts#show"



resources :users
resources :posts
 
end
