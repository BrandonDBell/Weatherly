class PlannerController < ApplicationController
	def planner_show
		#hacky as hell validations, only checks if string is empty for right now
  		#tabless model makes validations somewhat of a pain
		if params[:location] == ""  || params[:city] == "" || params[:start_date] == "" || params[:start_end] == ""
			render 'planner_error'
		else
			#calling new method and passing in params from form
	    	@planner = Planner.new(params[:location], params[:city], params[:start_date], params[:end_date])
	    	@planner.fetch_weather
    	end
	end
end
