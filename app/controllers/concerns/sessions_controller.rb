class SessionsController < ApplicationController
	def new 
	end

	def create
		user = User.find_by_email(params[:session][:email]).try(:authenticate, params[:session][:password])
		if user
			if user.is_active?
				session[:user_id] = user.user_id
				redirect_to (session[:target_url] || root_path)
				flash[:notice] = "success"
			else
				redirect_to new_session_path
				flash[:error] = "fail"
		else
			redirect_to new_session_path
			flash[:error] = "invalid email or password"
		end
	end
end