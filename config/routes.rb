Rails.application.routes.draw do

  namespace :v1 do

    resources :gyms, except: %i[ new ] do
      resources :members, except: %i[ new ]
      resources :employees, except: %i[ new ]
    end

    resources :members, only: %i[ index show create ] do
      post    '/visits',            to: 'visits#status'
    end

    resources :employees, only: %i[ index show update  ] do
      post    '/shifts',               to: 'shifts#status'
    end


  end

end
