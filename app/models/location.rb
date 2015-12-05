class Location < ActiveRecord::Base
# is this necessary for association?
  belongs_to :user

  	def self.search_for(query)
		where('"name" LIKE :query OR "city" LIKE :query OR "state" LIKE :query OR "zip" LIKE :query', query: "%#{query}%")
	end
end
