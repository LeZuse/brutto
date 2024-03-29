Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'sessions' }

  resources :invoices, only: [:index, :show, :update] do
    collection { put :synchronize }

    resources :lines, controller: 'invoice_lines'
  end

  root to: 'root#index'
end
