Rails.application.routes.draw do
  resources :clearance_batches, only: [:index, :create] do
    resources :items
  end

  resources :items do
    collection do
      get 'search'    
    end
  end

  root to: "clearance_batches#index"
end
