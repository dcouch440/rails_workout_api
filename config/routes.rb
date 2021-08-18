Rails.application.routes.draw do

  resources :gyms, only: %i[ create index show update destroy ] do
    resource :members, only: %i[ create update destroy show ]
    resource :employees, only: %i[ create update destroy show ]
  end

  resources :employees, only: %i[ create index show update ] do
    resource :shifts, only: %i[ create update ]
  end

  resources :members, only: %i[ create index show update ] do
    resource :visits, only: %i[ create update ]
  end

end
