class HourlyLookupController < ApplicationController

	def hourly
    	@hourly_lookup = HourlyLookup.new
	end

end
