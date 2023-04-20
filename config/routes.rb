Rails.application.routes.draw do
  get "/users/new" => "user#new"
  post "/login" => "user#login"
  post "/logout" => "user#logout"
  post "/users/create" => "user#create"
  
  
  get "/" => "home#top"
  
  get "/posts/:id" => "post#index"
  post "/posts/create" =>"post#create"
  post "/posts/:id/destroy" => "post#destroy"  
  
end
