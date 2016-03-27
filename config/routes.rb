Rails.application.routes.draw do
  devise_for :users

  resources :projects, except: [:new, :edit] do
    resources :tasks, except: [:new, :edit, :index]
  end

  resources :tasks, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  root to: 'application#angular'
end
