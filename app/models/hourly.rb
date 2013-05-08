class Hourly
	#include ActiveModel::Validations
	#settes and getters
	attr_reader :location, :city
	attr_accessor :temperature, :icon, :feel, :condition, :wind, :location, :city, :cityfixed, :test

	#initializing passed in variables so they can be
	#corrected and used in the model
	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@cityfixed = city.gsub(' ', '_')
    	@city = city
    end

    #retrieving api get request
	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/hourly/q/#{location}/#{cityfixed}.xml")
	    parse_response(response)
	end

	#parsing the data that will be called on the show page
	def parse_response(response)
		#attempting to have validation on error response from api get
		#testing = response.parsed_response['response']['error']
		#self.test = testing['type']
		#if(self.test.to_s == 'querynotfound')
		#if(!response.parsed_response['response']['error']['type'].to_s.blank?)
		#{
		#	render(template: 'hourly_error')
		#}
		#else
		#{
			hourly_forecast_temperature = response.parsed_response['response']['hourly_forecast']['forecast'].first
		    self.temperature = hourly_forecast_temperature['temp']['english']
		    self.icon = hourly_forecast_temperature['icon_url']

		    hourly_forecast_feel = response.parsed_response['response']['hourly_forecast']['forecast'].first
		    self.feel = hourly_forecast_feel['feelslike']['english']

		    hourly_forecast_condition = response.parsed_response['response']['hourly_forecast']['forecast'].first
		    self.condition = hourly_forecast_condition['dewpoint']['condition']

		    hourly_forecast_wind = response.parsed_response['response']['hourly_forecast']['forecast'].first
		    self.wind = hourly_forecast_wind['wdir']['dir']
		#}
		#end
	end
end