Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :create, :update, :destroy, :new, :edit]
  root to: 'cats#index'
  resources :cat_rental_requests, only: [:new, :create, :update]
  post '/approve/:id', to: "cat_rental_requests#approve", as: :approve_cat
  post '/deny/:id', to: "cat_rental_requests#deny", as: :deny_cat
end
