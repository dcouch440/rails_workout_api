Rails.application.routes.draw do

  namespace :v1 do

    resources :gyms, except: %i[ new ] do
      resources :members, except: %i[ new ]
      resources :employees, except: %i[ new ]
    end

    resources :members, only: %i[ index show create ] do
      resources :visits, only: %i[ index update show ]
      post '/visits', to: 'visits#status'
    end

    resources :employees, only: %i[ index show update  ] do
      resources :shifts, only: %i[ index update show ]
      post '/shifts', to: 'shifts#status'
    end

  end

end
