class Guide < ApplicationRecord
  belongs_to :standard
  	# this model's methods take the key value pairs from the submittted csv to make guides
  	# by comparing scores to domains,choosing the next domain without demonstrated compentency
  	# as a learning track in string form for saving to csv format.

  def make_guide(tests, hashed_domains, max = 5, size = 0)
  	catch :completed do
      hashed_domains.each do |key,val|
        val.each do |domain|
          if tests[domain].to_i <= key.to_i
            stringify(key, domain)
            throw :completed if (size += 1) == max
          end
        end
      end
  	end
  end

  def stringify(year, domain)
  	string = "#{year}.#{domain}"
  	 if self.path.nil?
        self.path = string
      else
        self.path << "," + string
      end 
    end

end
