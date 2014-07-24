Rails.application.routes.draw do
  resources :clearance_batches, only: [:index, :create] do
    resources :items
  end

  root to: "clearance_batches#index"
end
