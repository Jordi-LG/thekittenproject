Rails.application.routes.draw do
	root :to =>  "items#index"
	resources :items, only: [:index, :show], path: :image
  devise_for :users, path: :profil
  resources :carts, except: [:index], path: :monpanier do
  	resources :charges
	end
  resources :users, only: [:show], path: :monprofil
  resources :orders, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
