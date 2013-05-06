class Page
	attr_reader :ip
	attr_accessor :state, :city, :country, :temperature, :icon, :feel, :condition, :time, :wind, :image, :correctip, :winddir

	def initialize(ip)
    	@correctip = ip.to_s.match /\d+[.]\d+[.]\d+[.]\d+/
    end

	def info
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/geolookup/q/autoip.xml?geo_ip=#{correctip}")
	    #response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/geolookup/q/autoip.xml?geo_ip=67.174.63.74")
	    if response.nil?
	    	redirect_to :back
	    end
	    if (response.code == 200)
	    	first_parse(response)
	    else
	    	redirect_to :back
	    end
	end

	def first_parse(response)
		location = response.parsed_response['response']['location']
		@country = location['country']
		@state = location['state']
		@city = location['city']
	end

	def hourly
		response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/hourly/q/#{state}/#{city}.xml")
	    if response.nil?
	    	redirect_to :back
	    end
	    second_parse(response)
	end

	def second_parse(response)
		hourly_info = response.parsed_response['response']['hourly_forecast']['forecast'].first
		self.temperature = hourly_info['temp']['english']
		self.icon = hourly_info['icon_url']
		
		hourly_feel = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.feel = hourly_feel['feelslike']['english']

	    hourly_condition = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.condition = hourly_condition['condition']

	    hourly_time = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.time = hourly_time['FCTTIME']['pretty']

	    hourly_wind = response.parsed_response['response']['hourly_forecast']['forecast'].first
	    self.wind = hourly_wind['wdir']['dir']
	    self.winddir = hourly_wind['wdir']['degrees']
	end

	def satellite
		response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/satellite/q/#{state}/#{city}.xml")
	    if response.nil?
	    	redirect_to :back
	    end
	    third_parse(response)
	end

	def third_parse(response)
		satellite_image = response.parsed_response['response']['satellite']
	    self.image = satellite_image['image_url']
	end

end