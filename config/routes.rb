Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gyms, only: %i[ create index show destroy ] do
    resource :members, only: %i[ create update destroy show ]
    resource :employees, only: %i[ create update destroy show ]
  end

  resources :employees, only: %i[ create update destroy show ] do
    resource :shifts, only: %i[ create update ]
  end

  resources :members, only: %i[ create update destroy show ] do
    resource :visits, only: %i[ create update ]
  end

end
