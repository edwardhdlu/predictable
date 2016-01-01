Rails.application.routes.draw do
	devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}

	resources :users, only: [:create]
	resources :predictions
	resources :support
	resources :votes

	root 'predictions#index'

	get "/404", to: "errors#not_found"
end
