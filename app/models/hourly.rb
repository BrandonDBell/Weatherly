class MyValidator < ActiveModel::Validator
 	def validate(location, city)
    	if @location.blank? || @city.blank?
      		record.errors[:base] = "This record is invalid"
    	end
 	end
end

class Hourly
	include ActiveModel::Validations
	attr_reader :location, :city
  	
	attr_accessor :temperature, :icon, :feel, :condition, :wind, :location, :city, :cityfixed

	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@cityfixed = city.gsub(' ', '_')
    	@city = city
    end
	validates_with MyValidator
	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/hourly/q/#{location}/#{cityfixed}.xml")
	    parse_response(response)
	end

	def parse_response(response)
	    hourly_forecast_temperature = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.temperature = hourly_forecast_temperature['temp']['english']
	    self.icon = hourly_forecast_temperature['icon_url']

	    hourly_forecast_feel = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.feel = hourly_forecast_feel['feelslike']['english']

	    hourly_forecast_condition = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.condition = hourly_forecast_condition['dewpoint']['condition']

	    hourly_forecast_wind = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.wind = hourly_forecast_wind['wdir']['dir']
	end
end