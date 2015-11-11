require 'rails_helper'

describe Vehicle do
	it 'has a valid factory' do
		except(build(:vehicle)).to be_valid
	end

	it 'is invalid without a year' do
		except(build(:vehicle, year: nil)).to_not be_valid
	end
end