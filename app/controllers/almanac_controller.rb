class AlmanacController < ApplicationController
	def almanac_show
		#hacky as hell validations, only checks if string is empty for right now
  		#tabless model makes validations somewhat of a pain
		if params[:location] == ""  || params[:city] == ""
			render 'almanac_error'
		else
			#calling new method and passing in params from form
	    	@almanac = Almanac.new(params[:location], params[:city])
	    	@almanac.fetch_weather
	    	@almanac.get_date
	    end
	end
end
