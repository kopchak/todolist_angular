Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth'

  resources :projects, except: [:new, :edit, :show], shallow: true do
    resources :tasks, only: [:create, :update, :destroy] do
      resources :comments, only: [:create, :destroy] do
        resources :attachments, only: [:create, :destroy]
      end
    end
  end

  root to: 'application#angular'
end
