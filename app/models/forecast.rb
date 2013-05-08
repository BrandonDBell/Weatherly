class Forecast
	#settes and getters
	attr_reader :location, :city
	attr_accessor :location, :city, :cityfixed, :weekday1, :high1, :low1, :icon1, :icon_url1, :wind1, :humidity1, :conditions1,
	:weekday2, :high2, :low2, :icon2, :icon_url2, :wind2, :humidity2, :conditions2, :weekday3, :high3, :low3, :icon3, 
	:icon_url3, :wind3, :humidity3, :conditions3, :weekday4, :high4, :low4, :icon4, :icon_url4, :wind4, :humidity4, 
	:conditions4, :weekday5, :high5, :low5, :icon5, :icon_url5, :wind5, :humidity5, :conditions5, :month1, :day1, :year1,
	:month2, :day2, :year2

	#initializing passed in variables so they can be
	#corrected and used in the model
	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@cityfixed = city.gsub(' ', '_')
    	@city = city
    end

    #retrieving api get request
	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/forecast10day/q/#{location}/#{cityfixed}.xml")
	    if response.nil?
	    	redirect_to :back
	    end
	    parse_response(response)
	end

	#there is a ton of parsing in this one
	#probably a way to make all of it dynamic, but its fast enough for now
	def parse_response(response)
	    forecast_first = response.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday'].first
	    self.weekday1 = forecast_first['date']['weekday']
	    self.month1 = forecast_first['date']['monthname']
	    self.day1 = forecast_first['date']['day']
	    self.year1 = forecast_first['date']['year']
	    self.high1 = forecast_first['high']['fahrenheit']
	    self.low1 = forecast_first['low']['fahrenheit']
	    self.conditions1 = forecast_first['conditions']
	    self.icon_url1 = forecast_first['icon_url']
	    self.icon1 = forecast_first['icon']
	    self.wind1 = forecast_first['avewind']['mph']
	    self.humidity1 = forecast_first['avehumidity']

	    forecast_second = response.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday'].second
	    self.weekday2 = forecast_second['date']['weekday']
	    self.high2 = forecast_second['high']['fahrenheit']
	    self.low2 = forecast_second['low']['fahrenheit']
	    self.conditions2 = forecast_second['conditions']
	    self.icon_url2 = forecast_second['icon_url']
	    self.icon2 = forecast_second['icon']
	    self.wind2 = forecast_second['avewind']['mph']
	    self.humidity2 = forecast_second['avehumidity']

	    forecast_third = response.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday'].third
	    self.weekday3 = forecast_third['date']['weekday']
	    self.high3 = forecast_third['high']['fahrenheit']
	    self.low3 = forecast_third['low']['fahrenheit']
	    self.conditions3 = forecast_third['conditions']
	    self.icon_url3 = forecast_third['icon_url']
	    self.icon3 = forecast_third['icon']
	    self.wind3 = forecast_third['avewind']['mph']
	    self.humidity3 = forecast_third['avehumidity']

	    forecast_fourth = response.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday'].fourth
	    self.weekday4 = forecast_fourth['date']['weekday']
	    self.high4 = forecast_fourth['high']['fahrenheit']
	    self.low4 = forecast_fourth['low']['fahrenheit']
	    self.conditions4 = forecast_fourth['conditions']
	    self.icon_url4 = forecast_fourth['icon_url']
	    self.icon4 = forecast_fourth['icon']
	    self.wind4 = forecast_fourth['avewind']['mph']
	    self.humidity4 = forecast_fourth['avehumidity']

	    forecast_fifth = response.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday'].fifth
	    self.weekday5 = forecast_fifth['date']['weekday']
	    self.month2 = forecast_fifth['date']['monthname']
	    self.day2 = forecast_fifth['date']['day']
	    self.year2 = forecast_fifth['date']['year']
	    self.high5 = forecast_fifth['high']['fahrenheit']
	    self.low5 = forecast_fifth['low']['fahrenheit']
	    self.conditions5 = forecast_fifth['conditions']
	    self.icon_url5 = forecast_fifth['icon_url']
	    self.icon5 = forecast_fifth['icon']
	    self.wind5 = forecast_fifth['avewind']['mph']
	    self.humidity5 = forecast_fifth['avehumidity']
	    end
end