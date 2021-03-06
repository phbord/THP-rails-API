Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show]
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
    resources :articles do
      resources :comments
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
