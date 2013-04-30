class Forecast
	attr_reader :location, :city
	attr_accessor :fcttext1, :icon1, :day1, :fcttext2, :icon2, :day2, :fcttext3, :icon3, :day3, :fcttext4, :icon4, :day4, 
	:fcttext5, :icon5, :day5, :fcttext6, :icon6, :day6, :fcttext7, :icon7, :day7, :fcttext8, :icon8, :day8, 
	:fcttext9, :icon9, :day9, :fcttext10, :icon10, :day10, :location, :city

	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@city = city.gsub(' ', '_')
    end

	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/forecast10day/q/#{location}/#{city}.xml")
	    if response.nil?
	    	redirect_to :back
	    end
	    parse_response(response)
	end

	def parse_response(response)
	    forecast_first = response.parsed_response['response']['forecast']['txt_forecast']['forecastdays']['forecastday'].first
	    self.fcttext1 = forecast_first['fcttext']
	    self.icon1 = forecast_first['icon_url']
	    self.day1 = forecast_first['title']

	end
end