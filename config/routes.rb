Rails.application.routes.draw do


	get '/gitinfo', to: 'students#gitinfo'

	root 'api/students#index'  
  get 'api/students/:id/resources', to: 'api/students#resources'
  namespace :api do
    resources :students
  end
end