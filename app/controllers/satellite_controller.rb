class SatelliteController < ApplicationController
	def satellite_show
		#hacky as hell validations, only checks if string is empty for right now
  		#tabless model makes validations somewhat of a pain
		if params[:location] == ""  || params[:city] == ""
			render 'satellite_error'
		else
			#calling new method and passing in params from form
	    	@satellite = Satellite.new(params[:location], params[:city])
	    	@satellite.fetch_weather
	    	@satellite.fetch_image
    	end
	end
end
