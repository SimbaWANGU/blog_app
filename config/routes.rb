Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :authors
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'authors#index'

  resources :authors, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  get 'authors/:author_id/posts_list', to: 'api#list_all_author_posts', as: :list_all_author_posts
  get 'authors/:author_id/posts/:post_id/comments_list', to: 'api#list_all_post_comments', as: :list_all_post_comments
  post 'authors/:author_id/posts/:post_id/add_comment', to: 'api#add_comment', as: :add_comment


  get '/posts/:id/newcomment', to: "comments#new_comment"
  post '/addcomment/:id', to: "comments#add_comment"
  post '/addlike/:id', to: "likes#add_like"
  delete '/delete/:id', to: "posts#delete_post"
  delete 'deletecomment/:id', to: "comments#delete_comment"
  
end
