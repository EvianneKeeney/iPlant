Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, path: 'auth', path_names: { 
    sign_in: 'sign_in', sign_out: 'sign_out',
    password: 'secret', confirmation: 'verification', 
    unlock: 'unblock', registration: 'register', sign_up: 'sign_up' 
  }

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    devise_scope :user do
      authenticated :user do
        resources :plants
      end
    end

    devise_scope :user do
      authenticated :user do
        namespace :api do
          namespace :v1 do
            resources :sessions, defaults: {format: :json}
          end
        end
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :plants


  resources :users do
    resources :plants
  end


  namespace :api do
    namespace :v1 do
      resources :plants
    end
  end

  namespace :api do
    namespace :v1 do
      resources :weathers
    end
  end


  resources :plants do
    resources :timers
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
