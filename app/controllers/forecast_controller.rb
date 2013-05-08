class ForecastController < ApplicationController
	def forecast_show
		#hacky as hell validations, only checks if string is empty for right now
  		#tabless model makes validations somewhat of a pain
		if params[:location] == ""  || params[:city] == ""
			render 'forecast_error'
		else
			#calling new method and passing in params from form
	    	@forecast = Forecast.new(params[:location], params[:city])
	    	@forecast.fetch_weather
	    end
	end
end