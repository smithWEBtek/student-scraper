class Student < ApplicationRecord
	
	@@students = []

	def self.students
		@@students 
	end
 
	def self.sg
		page = HTTParty.get('https://learn.co/study-groups/live-discussion-intro-to-ruby-pt-1-variables-m')
		parse = Nokogiri::HTML(page)
		@students = []
		parse.css('div.media-block__media a').each do |item| 
			student = {
			github: item.attributes['href'].value,
			avatar: item.children[0].children[0].attributes['src'].value,
			learn: "https://learn.co#{item.attributes['href'].value}"
		}
		newStudent = Student.new(
			github: student["github"], 
			avatar: student["avatar"], 
			learn: student["learn"])
		newStudent.save
		end
	end

		
	
	# "name"
	# "hometown"
	# "last_lab"
	# "current_track"
	# "learn"
	# "avatar"
	
		#js--region-main > div > div.level.level--background-color-blue-light.util--padding-tm.util--padding-bm > div > div > div.media-block__content.media-block__content--fill > div > div > div.heading.heading--level-1.heading--font-size-largest.heading--color-grey-dark
		
		
  
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
