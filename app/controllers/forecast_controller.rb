class ForecastController < ApplicationController
	def show
    	@forecast = Forecast.new(params[:location], params[:city])
    	@forecast.fetch_weather
	end
end
