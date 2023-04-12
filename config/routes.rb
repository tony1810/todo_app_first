Rails.application.routes.draw do
  get "/" => "home#top"
  get "/posts" => "post#index"
  
end
