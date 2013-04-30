class Satellite
	attr_reader :location, :city
	attr_accessor :image, :location, :city

	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@city = city.gsub(' ', '_')
    end

	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/satellite/q/#{location}/#{city}.xml")
	    if response.nil?
	    	redirect_to :back
	    end
	    parse_response(response)
	end

	def parse_response(response)
	    satellite_image = response.parsed_response['response']['satellite']
	    self.image = satellite_image['image_url']
	end
end