require 'rails_helper'
require 'spec_helper'

feature 'User signs in' do
	scenario 'with valid credentials' do
		User.create!(email: "joe@example.com", password: "passw0rd")
		visit user_session_path
		fill_in 'Email', with: 'joe@example.com'
		fill_in 'Password', with: 'passw0rd'
		click_on 'Sign In'

		expect(page).to have_content("joe@example.com")
	end
end