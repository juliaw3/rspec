class VehiclesController < ApplicationController
	def create
		@vehicle = Vehicle.new(vehicle_params)

		respond_to do |format|
			if @vehicle.save
				format.html {redirect_to vehicle_path(@vehicles), notice: 'Vehicle was successfully created.'}
				format.json {render json: @vehicle, status: created, location: @vehicle}
			else
				format.html {render action: 'new'}
				format.json {render json: @vehicle.errors, status: :unprocessable_entity}
			end
		end
	end
end
