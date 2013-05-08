class HourlyController < ApplicationController
  	def hourly_show
  		#hacky as hell validations, only checks if string is empty for right now
  		#tabless model makes validations somewhat of a pain
    	if params[:location] == ""  || params[:city] == ""
			render 'hourly_error'
		else
			#calling new method and passing in params from form
			@hourly = Hourly.new(params[:location], params[:city])
			@hourly.fetch_weather
		end
	end
end
