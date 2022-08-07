class AlexaServices
	include HTTParty

	API_KEY = "8T7SlYd7Tp16a9VPBovC26LXGhosXjeM97CLbUUv"
	BASE_URL = "https://awis.api.alexa.com/api"

	ACTION = "UrlInfo"
	RESPONSEGROUP = "Rank"
	OUTPUT = "json"
	URL = "cluvi.co"

	def self.alexa_rank
		p "#{BASE_URL}?Action=#{ACTION}&ResponseGroup=#{RESPONSEGROUP}&Output=#{OUTPUT}&Url=#{URL}"
		p '*****'
		response = HTTParty.get("#{BASE_URL}?Action=#{ACTION}&ResponseGroup=#{RESPONSEGROUP}&Output=#{OUTPUT}&Url=#{URL}",
								headers: {"x-api-key" => "#{API_KEY}",
										  'Accept' => 'application/json'})
		JSON.parse(response.body)
	end

	
end	