class SatelliteController < ApplicationController

	def show
    	@satellite = Satellite.new
	end
end
