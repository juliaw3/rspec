require 'rails_helper'

describe Post do
	it 'has a valid title' do
		expect(build(:post)).to be_valid
	end

	it 'is invalid if not published' do
		expect(build(:post).published).to eq(false)
	end
	
end