require 'rails_helper'

describe Post do
	it 'has a valid title' do
		except(build(:post)).to be_valid
	end

	it 'is invalid without being published' do
		expect(build(:post, published: false)).to_not be_valid
	end
	
end