class StudentsController < ApplicationController
 
	def index 
		@students = Student.all
		redirect_to 'students/index'
	end

	def gitinfo
		binding.pry

		client_id = ENV['client_id']
		client_secret = ENV['client_secret']
		student = params[:student]

		@resp = Faraday.get "https://api.github.com/users/#{student.github}" do |req| 
			req.params['client_id'] = client_id
			req.params['client_secret'] = client_secret
			req.params['q'] = params[:query]
			end
		body = JSON.parse(@resp.body)

binding.pry

			if @resp.success?
				@repos = body["items"]
			else
				@error = "errors! oh my!" #body["meta"]["errorDetail"]
			end
		render 'search'
	end
 end
