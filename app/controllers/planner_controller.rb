class PlannerController < ApplicationController
	def planner_show
    	@planner = Planner.new(params[:location], params[:city], params[:start_date], params[:end_date])
    	@planner.fetch_weather
	end
end
