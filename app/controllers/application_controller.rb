class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	# If session is timed out catch the exception & handle it with 'invalid_token' helper
	rescue_from ActionController::InvalidAuthenticityToken, :with => :invalid_token

	include SessionsHelper

	# Check logged in user before every action or request
	before_action :require_login

	# Shared before filters
	protected

		# Confirms a logged-in user.
		# If user is not logged in redirect to login page
		# and show a warning message
		def logged_in_user
			unless logged_in?
				store_location
				flash[:danger] = 'Please log in!'
				redirect_to login_url
			end
		end

	# Private before filters
	private

		# Check if user is logged in, if not redirect to
		# login page & show a warning message
		# If user is logged in it can be accessed through the
		# 'current_user'
		def require_login
			unless current_user
				store_location
				flash[:danger] = 'Please log in!'
				redirect_to login_url
			end
		end

		# Invalid token handler, used when timed out
		# session is cached
		def invalid_token
			redirect_to login_url
		end

end
