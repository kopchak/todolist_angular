Rails.application.routes.draw do
  devise_for :users

  resources :projects, except: [:new, :edit, :show] do
    resources :tasks, only: [:create, :update, :destroy]
  end

  resources :tasks, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments, only: [] do
    resources :attachments, only: [:create, :destroy]
  end

  root to: 'application#angular'
end
