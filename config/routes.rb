Rails.application.routes.draw do
	
	resources :students
	root '/students#index'
	get '/gitinfo', to: 'students#gitinfo'
end
