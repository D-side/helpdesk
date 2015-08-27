Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :users do
    resources :tickets, param: :reference, only: [:index, :show] do
      get '/:scope', on: :collection, action: :index
      resources :responses, only: [:create, :edit, :update]
    end
  end

  resources :tickets,
    param: :reference,
    path: '',
    path_names: { new: '' },
    only: [:new, :create, :show] do
    resources :responses, only: [:create]
  end

  # Provides root_path helper and should never match
  root 'tickets#new'
  # Are there even any cases where it's not '/'?..
end
