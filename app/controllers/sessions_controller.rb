class SessionsController < ApplicationController
	skip_before_filter :require_login

	def new
		if logged_in?
			redirect_to home_url
		end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			if user.activated?
				log_in user
				params[:session][:remember_me] == '1' ? remember(user) : forget(user)
				redirect_back_or user
			else
				message         = 'Account not activated. Contact admin!'
				flash[:warning] = message
				redirect_to login_url
			end
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to login_url
	end

end
