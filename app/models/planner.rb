class Planner
	attr_reader :location, :city, :date, :start_date, :end_date
	attr_accessor :location, :city, :cityfixed, :date, :date_temp, :startdate, :enddate, :title, :min, 
	:avg, :max, :precipmin, :precipavg, :precipmax, :dewmin, :dewavg, :dewmax, :sunny, :sunnyper,
	:rain, :rainper, :thunder, :thunderper, :wind, :windper, :snow, :snowper, :tornado, :tornadoper,
	:freeze, :freezeper, :overfreeze, :overfreezeper, :hail, :hailper, :fog, :fogper, :warm, :warmper,
	:hot, :hotper, :sweltering, :swelteringper, :humid, :humidper

	def initialize(location, city, start_date, end_date)
    	@location = location.gsub(' ', '_')
    	@cityfixed = city.gsub(' ', '_')
    	@city = city
    	@date = "planner_" + start_date.gsub('/', '') + end_date.gsub('/', '')
    end

	def fetch_weather
	    response = HTTParty.get("http://api.wunderground.com/api/cdb75d07a23ad227/#{date}/q/#{location}/#{cityfixed}.xml")
	    if !response.nil?
	    	parse_response(response)
	    else
	    	redirect_to root_path
	    end
	end

	def parse_response(response)
	    date_title = response.parsed_response['response']['trip']
	    self.title = date_title['title']

	    date_start = response.parsed_response['response']['trip']['period_of_record']['date_start']['date']
	    self.startdate = date_start['pretty']

	    date_end = response.parsed_response['response']['trip']['period_of_record']['date_end']['date']
		self.enddate = date_end['pretty']

		#elements
	  	minprecip = response.parsed_response['response']['trip']['precip']['min']
	    self.precipmin = minprecip['in']
	    avgprecip = response.parsed_response['response']['trip']['precip']['avg']
	    self.precipavg = avgprecip['in']
	    maxprecip = response.parsed_response['response']['trip']['precip']['max']
	    self.precipmax = maxprecip['in']

	    mindewpoint = response.parsed_response['response']['trip']['dewpoint_high']['min']
	    self.dewmin = mindewpoint['F']
	    avgdewpoint = response.parsed_response['response']['trip']['dewpoint_high']['avg']
	    self.dewavg = avgdewpoint['F']
	    maxdewpoint = response.parsed_response['response']['trip']['dewpoint_high']['max']
	    self.dewmax = maxdewpoint['F']

	    chance_of_sunny = response.parsed_response['response']['trip']['chance_of']['chanceofsunnycloudyday']
	    self.sunny = chance_of_sunny['name']
	    self.sunnyper = chance_of_sunny['percentage']

	    chance_of_rain = response.parsed_response['response']['trip']['chance_of']['chanceofrainday']
	    self.rain = chance_of_rain['name']
	    self.rainper = chance_of_rain['percentage']

	    chance_of_thunder = response.parsed_response['response']['trip']['chance_of']['chanceofthunderday']
	    self.thunder = chance_of_thunder['name']
	    self.thunderper = chance_of_thunder['percentage']

	    chance_of_wind = response.parsed_response['response']['trip']['chance_of']['chanceofwindyday']
	    self.wind = chance_of_wind['name']
	    self.windper = chance_of_wind['percentage']

	    chance_of_snow = response.parsed_response['response']['trip']['chance_of']['chanceofsnowday']
	    self.snow = chance_of_snow['name']
	    self.snowper = chance_of_snow['percentage']

	    chance_of_tornado = response.parsed_response['response']['trip']['chance_of']['chanceoftornadoday']
	    self.tornado = chance_of_tornado['name']
	    self.tornadoper = chance_of_tornado['percentage']

	    chance_of_hail = response.parsed_response['response']['trip']['chance_of']['chanceofhailday']
	    self.hail = chance_of_hail['name']
	    self.hailper = chance_of_hail['percentage']

	    chance_of_fog = response.parsed_response['response']['trip']['chance_of']['chanceoffogday']
	    self.fog = chance_of_fog['name']
	    self.fogper = chance_of_fog['percentage']

	    #temperature
	    date_mintemp = response.parsed_response['response']['trip']['temp_high']['min']
	    self.min = date_mintemp['F']
	    date_avgtemp = response.parsed_response['response']['trip']['temp_high']['avg']
	    self.avg = date_avgtemp['F']
	    date_maxtemp = response.parsed_response['response']['trip']['temp_high']['max']
	    self.max = date_maxtemp['F']

	    chance_of_freezing = response.parsed_response['response']['trip']['chance_of']['tempbelowfreezing']
	    self.freeze = chance_of_freezing['name']
	    self.freezeper = chance_of_freezing['percentage']

	    chance_of_overfreezing = response.parsed_response['response']['trip']['chance_of']['tempoverfreezing']
	    self.overfreeze = chance_of_overfreezing['name']
	    self.overfreezeper = chance_of_overfreezing['percentage']

	    chance_of_oversixty = response.parsed_response['response']['trip']['chance_of']['tempoversixty']
	    self.warm = chance_of_oversixty['name']
	    self.warmper = chance_of_oversixty['percentage']

	    chance_of_overninety = response.parsed_response['response']['trip']['chance_of']['tempoverninety']
	    self.hot = chance_of_overninety['name']
	    self.hotper = chance_of_overninety['percentage']

	    chance_of_sultry = response.parsed_response['response']['trip']['chance_of']['chanceofsultryday']
	    self.sweltering = chance_of_sultry['name']
	    self.swelteringper = chance_of_sultry['percentage']

	    chance_of_humid = response.parsed_response['response']['trip']['chance_of']['chanceofhumidday']
	    self.humid = chance_of_humid['name']
	    self.humidper = chance_of_humid['percentage']
	end
end