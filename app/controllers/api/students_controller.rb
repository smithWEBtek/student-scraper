class Api::StudentsController < ApplicationController
 
	def index 
		@students = Student.all
		render json: @students
		# responders :json, :http_cache
		# responders :json
	end
 end

