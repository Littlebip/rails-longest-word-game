Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
end

# Rails.application.config.session_store :cookie_store, key: '_your_app_session'
