module Features
	module SessionHelpers
		def sign_up_with(email, password)
			visit sign_up_path
			fill_in 'Email', with email
			fill_in 'Password', with password
			click_button 'Sign up'
		end
		def sign_in
			user = create(:user)
			visit sign_in_path
			fill_in 'Email', with email
			fill_in 'Password', with password
			click_button 'sign_in'
		end
	end
end
