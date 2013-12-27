Tweetability::Application.routes.draw do

  root "sessions#new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :sessions

  resources :users do
    resource :tweets do
      collection do
        get 'list'
      end
      get 'fetch'
    end
  end

  get 'users/:id/tweets/fetch' => 'tweets#fetch'
end
