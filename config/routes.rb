Rails.application.routes.draw do
  devise_for :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'authors#index'

  resources :authors, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  get '/posts/:id/newcomment', to: "comments#new_comment"
  post '/addcomment/:id', to: "comments#add_comment"
  post '/addlike/:id', to: "likes#add_like"
  delete '/delete/:id', to: "posts#delete_post"
  delete 'deletecomment/:id', to: "comments#delete_comment"
  
end
