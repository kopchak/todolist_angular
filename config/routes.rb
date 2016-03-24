Rails.application.routes.draw do
  devise_for :users

  resources :projects, except: [:new, :edit] do
    resources :tasks, except: [:new, :edit, :index]
  end

  resources :tasks, only: [] do
    resources :comments, except: [:new, :edit, :index]
  end

  root to: 'application#angular'
end
