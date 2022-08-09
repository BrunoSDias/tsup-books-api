Rails.application.routes.draw do
  defaults format: :json do
    scope :api do
      scope :v1 do
        devise_for :users, controllers: { 
          sessions: 'api/v1/users/sessions',
          registrations: 'api/v1/users/registrations'
        }
      end
    end

    namespace :api do
      namespace :v1 do
        get '/users/by_token', to: 'users/search#by_token'
        resources :books
      end
    end
  end
end
