class Student < ApplicationRecord

	def self.sg
		page = HTTParty.get('https://learn.co/study-groups/live-discussion-intro-to-ruby-pt-1-variables-m')
		parse = Nokogiri::HTML(page)
		parse.css('div.media-block__media a').each do |item| 
			student = Student.find_or_create_by(login: item.attributes['href'].value)
			student.gitinfo
		end
	end
	
	def learn_login
		"https://learn.co/" + self.login
	end

	def gitinfo
		client_id = ENV['client_id']
		client_secret = ENV['client_secret']
		@resp = Faraday.get "https://api.github.com/users#{self.login}" do |req|
			req.params['client_id'] = client_id
			req.params['client_secret'] = client_secret
		end

		if @resp.success?
			body = JSON.parse(@resp.body)
			self.github_id = body["id"]
			self.login = body["login"]
			self.url = body["url"]
			self.avatar_url = body["avatar_url"]
			self.name = body["name"]
			self.blog = body["blog"]
			self.location = body["location"]
			self.bio = body["bio"]
			self.email = body["email"]
			self.learn = "https://learn.co/" + "#{body["login"]}"
			self.save
		else
			@error = "Response unsuccessful."
		end
	end
 
end
