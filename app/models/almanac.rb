class Almanac
	attr_reader :location, :city
	attr_accessor :location, :city, :date, :normal, :high, :record_high, :record_low, :low, :normal_low

	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@city = city.gsub(' ', '_')
    end

	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/almanac/q/#{location}/#{city}.xml")
	    if response.nil?
	    	redirect_to :back
	    end
	    parse_response(response)
	end

	def get_date
		@date = Date.today.to_s
	end

	def parse_response(response)
	    almanac_high = response.parsed_response['response']['almanac']['temp_high']
	    self.normal = almanac_high['normal']['F']
	    self.high = almanac_high['record']['F']
	    self.record_high = almanac_high['recordyear']

	    almanac_low = response.parsed_response['response']['almanac']['temp_low']
	    self.normal_low = almanac_low['normal']['F']
	    self.low = almanac_low['record']['F']
	    self.record_low = almanac_low['recordyear']
	end
end