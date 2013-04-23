class HourlyLookupController < ApplicationController

  	def show
    	@hourly_lookup = HourlyLookup.new(params[:location], params[:city])
    	@hourly_lookup.fetch_weather
	end
end
