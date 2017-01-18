Rails.application.routes.draw do
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
    get 'save' => 'events#save', as: :save
    get 'choose' => 'user_events#choose', as: :choose_user
    post 'add/:user_id' => 'user_events#add', as: :add_user
    resources :user_events
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
