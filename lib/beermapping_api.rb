class BeermappingApi
	def self.places_in(city)
		city = ERB::Util.url_encode(params[:city])
		url = ''
		response = HTTParty.get url+city
		baari_taulukko = response.parsed_response['bmp_locations']

        @places = []
		baari_taulukko.each do |baari|
			@places << Place.new(baari)
		end
	end
end