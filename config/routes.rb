Rails.application.routes.draw do

  namespace :users do
  get 'responses/edit'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :users do
    resources :tickets, param: :reference, only: [:index, :show] do
      get 'filter/:scope', on: :collection, action: :index, as: :filter
      get :find, on: :collection
      resources :responses, only: [:create]
    end
    resources :responses, only: [:edit, :update]
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
