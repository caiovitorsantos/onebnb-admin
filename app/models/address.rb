class Address < ApplicationRecord

	after_validation :geocode

	geocoded_by :full_address do |obj, results|
		if geo = results.first
			obj.latitude = geo.latitude
			obj.longitude = geo.longitude
		end
	end

	def full_address
		"#{ self.street }, #{ self.neighborhood }, #{ self.city } #{ self.number }, #{ self.country }"
	end

end