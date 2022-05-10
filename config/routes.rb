Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'top_pages#top'
  resources :lists do
    resources :songs
    collection do
      get 'search'
    end
  end

  resource :profile, only: %i[show edit update]
  resources :groups do
    member do
      get 'select'
      get 'join'
      delete 'group_destroy'
    end
  end
end
