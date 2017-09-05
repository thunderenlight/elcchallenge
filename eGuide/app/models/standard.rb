require 'csv'


class Standard < ApplicationRecord
	has_many :guides
	# this model's methods parse and put in key value pairs the submittted csv files.

	def run
		standardized_tests.each do |test|
			guide = guides.create(student: test["Student Name"])
			guide.make_guide(test, hashed_domains)
			guide.save!
		end
	end


	def hashed_domains
		domain = {}
		CSV.parse(domains).each do |row|
			domain[row.shift] = row
		end
		domain
	end

	def standardized_tests
		tested = []
		CSV.parse(tests, headers: true) do |row|
			tested << row.to_hash
		end
		tested
	end

	def save_csv
		file = CSV.generate do |csv|
			guides.each do |s| 
				csv << s.student.parse_csv + s.path.parse_csv
			end
		end
		file
	end


end
