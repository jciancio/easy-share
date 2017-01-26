Rails.application.routes.draw do
  get 'photos/create'

  get 'photos/edit'

  get 'photos/destroy'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'events#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :events do
    resources :photos
    get 'choose' => 'user_events#choose', as: :choose_user
    post 'add/:user_id' => 'user_events#add', as: :add_user
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
