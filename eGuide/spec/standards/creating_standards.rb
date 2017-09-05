require 'rails_helper.rb'

feature 'Saving Standard' do 
	scenario 'can save a new standard' do 

		    click_on 'Save CSV'
				header = page.response_headers['Content-Disposition']
				header.should match /^attachment/
				# header.should match /filename="my_file.csv"$/
	end
end