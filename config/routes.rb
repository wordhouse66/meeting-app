Rails.application.routes.draw do
  resources :date_ranges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#home'
  
  resources :clients do
    collection do
      get 'search'
    end
    resources :meetings
  end
  
  resources :calendars

  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  get '/meetings' => 'meetings#all_meetings'
  get '/preview' => 'meetings#preview'
  get '/preload' => 'meetings#preload'

end
