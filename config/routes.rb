Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "teams#index"
  get 'player/freeagents', :to => 'players#freeagents_index'

  resources :drafts, only: [:index, :new, :create, :show]
  resources :teams, only: [:index, :new, :create, :show]
  resources :players, only: [:new, :create, :destroy, :show]
  resources :contracts, only: [:new, :create, :destroy, :show, :edit, :update]
end
