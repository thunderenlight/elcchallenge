class Guide < ApplicationRecord
  belongs_to :standard


  def make_guide(tests, hashed_domains, size = 0, max = 5)
  	catch :completed do
      hashed_domains.each do |key,val|
        val.each do |domain|
          if tests[domain].to_i <= k.to_i
            stringify(key, domain)
            throw :completed if (size += 1) == max
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
