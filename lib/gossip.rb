require 'pry'
require 'csv'
class Gossip
	attr_accessor :author, :content

	@@all_gossips = []

	def initialize(author, content)
		if (author && content).is_a?(String)
			@author = author
			@content = content
		else 
		puts" we can't do nothing with this"
		end
	end  


	def save 
		CSV.open("./db/gossip.csv", "ab") do |csv|
    		csv << [@author, @content]
  		end
	end


	def self.all
  		#all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
    		@@all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  		return @@all_gossips
	end

	def self.find(id)
		#self.all
		@@all_gossips.fetch(id)
		#@@all_gossips.at(id).content
	end

end
#binding.pry


