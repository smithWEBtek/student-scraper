class Student < ApplicationRecord
	
	@@students = []

	def self.students
		@@students 
	end
 
	def self.sg
		page = HTTParty.get('https://learn.co/study-groups/live-discussion-intro-to-ruby-pt-1-variables-m')
		parse = Nokogiri::HTML(page)
		@students = []		
		
		# parse.css('div.media-block__media').each do |row|
		parse.css('li').each do |row|
			student = {}
			# binding.pry
			
			# "name"

			if row.css('a')
				student["name"] = row.css('a')[1].text 
			end

			# "hometown"
			# "last_lab"
			# "current_track"
			# "learn_id"
			# "slack"
			
			
			# "avatar"
			student['avatar'] = row.css('img').as_json.flatten[3] if row.css('img').as_json
			
			# "github"
			# student['github'] = row['href'], 
			# student['github'] = row.attributes['href'].value if row.attributes['href']
			@students.push(student) if !student['avatar'].nil?
		end
binding.pry
		# @students[6..@students.length].uniq
	end


	def self.si
		nurl = 'http://avatars.githubusercontent.com/u/29719360'
		page = HTTParty.get(nurl)
		parse = Nokogiri::HTML(page)
		@student = {}

			# "name"
			# "hometown"
			# "last_lab"
			# "current_track"
			# "learn_id"
			# "slack"
			# "github"
		
		
	end
 
end
