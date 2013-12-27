Tweetability::Application.routes.draw do

  root "sessions#new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :sessions
  resources :users

  resources :patterns do
    resource :tweets do
      collection do
        get 'list'
      end
    end
  end

  get 'patterns/:id/tweets/fetch' => 'tweets#fetch'
end
