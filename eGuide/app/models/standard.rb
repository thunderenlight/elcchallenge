require 'csv'


class Standard < ApplicationRecord
	has_many :guides


	def run
		standardized_tests.each do |tests|
			guide = standards.create(student: tests["Student Name"])
			guide.make_guide(tests, hashed_domains)
			guide.save!
		end
	end


	def hashed_domains
		domain = {}
		CSV.parse(domain).each do |row|
			domain[row.shift] = row
		end
		domain
	end

	def standardized_tests
		tests = []
		CSV.parse(tests, headers: true) do |row|
			tests << row.to_hash
		end
		tests
	end

	def save_csv
		file = CSV.generate do |csv|
			standards.each { |s| csv << s.student.parse_csv + s.path.parse_csv}
		end
		file
	end

	
end
