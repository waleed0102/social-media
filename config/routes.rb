Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations'
  }

  resources :posts, only: [:index, :create, :update, :destroy] do
    collection do
      get :mine
    end
    resources :comments, only: [:create, :update, :destroy]
  end
end
