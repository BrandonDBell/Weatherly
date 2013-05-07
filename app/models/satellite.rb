class Satellite
	attr_reader :location, :city
	attr_accessor :image, :location, :city, :radar_image, :cityfixed

	def initialize(location, city)
    	@location = location.gsub(' ', '_')
    	@cityfixed = city.gsub(' ', '_')
    	@city = city
    end

	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/satellite/q/#{location}/#{cityfixed}.xml")
	    parse_response(response)
	end

	def parse_response(response)
	    satellite_image = response.parsed_response['response']['satellite']
	    self.image = satellite_image['image_url']
	end

	def fetch_image
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/animatedradar/q/#{location}/#{cityfixed}.xml?newmaps=1&timelabel=1&timelabel.y=10&num=5&delay=50")
	    parse_radar(response)
	end

	def parse_radar(response)
	    self.radar_image = response.parsed_response['response']['radar']['image_url']
	end
end