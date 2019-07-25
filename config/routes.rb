Rails.application.routes.draw do

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
