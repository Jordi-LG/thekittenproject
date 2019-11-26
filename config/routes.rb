Rails.application.routes.draw do
	root :to =>  "items#index"
	resources :items, only: [:index, :show]
  devise_for :users
  resources :carts, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
