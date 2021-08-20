Rails.application.routes.draw do

  namespace :v1 do

    resources :gyms, except: %i[ new ] do

      get     '/members',           to: 'members#index'
      get     '/members/:id',       to: 'members#show'
      patch   '/members/:id',       to: 'members#update'
      post    '/members',           to: 'members#create'
      delete  '/members/:id',       to: 'members#destroy'

      get     '/employees',         to: 'employees#index'
      get     '/employees/:id',     to: 'employees#show'
      post    '/employees',         to: 'employees#create'
      patch   '/employees/:id',     to: 'employees#update'
      delete  '/employees/:id',     to: 'employees#destroy'

    end

    resources :members, only: %i[ index show create ] do
      post    '/visits',            to: 'visits#status'
    end

    resources :employees, only: %i[ index show update  ] do
      post    '/shifts',               to: 'shifts#status'
    end


  end

end
