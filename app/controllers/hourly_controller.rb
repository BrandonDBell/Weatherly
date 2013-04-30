class HourlyController < ApplicationController
  	def hourly_show
    	@hourly = Hourly.new(params[:location], params[:city])
    	@hourly.fetch_weather
	end
end
