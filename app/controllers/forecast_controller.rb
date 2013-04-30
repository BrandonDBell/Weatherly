class ForecastController < ApplicationController
	def forecast_show
    	@forecast = Forecast.new(params[:location], params[:city])
    	@forecast.fetch_weather
	end
end