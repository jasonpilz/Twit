Rails.application.routes.draw do
  root to: "welcome#index"
  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  post '/tweet', to: "pages#create"
  get '/:user', to: "pages#home"
end
