require 'rails_helper'

describe VehiclesController do 
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the vehicles' do
				post :create, vehicle: attributes_for(:vehicle)
				expect(Vehicle.count).to eq(1)
			end

			it 'redirects to the "show" action for the vehicle' do
				post :create, vehicle: attributes_for(:vehicle)
				expect(response).to redirect_to Vehicle.first
			end
		end

		context 'with invalid attributes' do
			it 'does not create the vehicle' do
				post :create, vehicle: attributes_for(:vehicle, year: nil)
				expect(Vehicle.count).to eq(0)
			end

			it 're-renders the "new" view' do
				post :create, vehicle: attributes_for(:vehicle, year: nil)
				expect(response).to render_template :new
			end
		end
	end
end