Rails.application.routes.draw do
  resources :tickets,
    param: :reference,
    path: '',
    path_names: { new: '' },
    only: [:new, :create, :show]
end
