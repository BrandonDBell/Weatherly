class PlannerController < ApplicationController
	def planner_show
    	@planner = Planner.new(params[:location], params[:city], params[:date])
    	@planner.fetch_weather
	end
end
