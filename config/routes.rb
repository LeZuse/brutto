Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'sessions' }

  resources :invoices, only: [:index, :show] do
    collection { put :synchronize }
  end

  root to: 'root#index'
end
