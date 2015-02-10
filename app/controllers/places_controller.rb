class PlacesController < ApplicationController
	def index
	end

	def search
		@places = BeermappingApi.places_in(params[city])
		if @places.empty?
			redirect_to places_path, notice: 'No bars in that city'
		else
		    render :index
		end
    end
end