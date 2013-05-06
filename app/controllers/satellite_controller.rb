class SatelliteController < ApplicationController
	def satellite_show
    	@satellite = Satellite.new(params[:location], params[:city])
    	@satellite.fetch_weather
    	@satellite.fetch_image
	end
end
