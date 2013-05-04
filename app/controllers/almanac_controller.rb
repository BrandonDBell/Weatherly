class AlmanacController < ApplicationController
	def almanac_show
    	@almanac = Almanac.new(params[:location], params[:city])
    	@almanac.fetch_weather
    	@almanac.get_date
	end
end
