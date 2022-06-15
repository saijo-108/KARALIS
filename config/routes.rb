Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'omniauth_callbacks'
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
    resources :comments, only: %i[create destroy]
    resources :group_users, only: %i[destroy]
    resources :list_groups, only: %i[edit update new create]
    member do
      get 'select'
      post 'join'
      delete 'group_destroy'
    end
  end

  get "/pages/*id" => 'pages#show', as: :page, format: false
end
