class Location < ActiveRecord::Base
# is this necessary for association?
  belongs_to :user

  	def self.search_for(query)
		where('cast(name as text) LIKE :query OR cast(city as text) LIKE :query OR cast(state as text) LIKE :query OR cast(zip as text) LIKE :query', query: "%#{cast(query as text)}%")
	end
end
