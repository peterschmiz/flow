class BookingsController < ApplicationController
	before_action :logged_in_user

	def index
		@booking_date = Date.today
		@booking_interval = 1
		if session[:booking_date]
			sdate = session[:booking_date]
			@booking_date = Date.new(sdate['year'].to_i, sdate['month'].to_i, sdate['day'].to_i)
		end
		if (session[:booking_interval])
			@booking_interval = session[:booking_interval]
		end
	end

	def setdate
		if params[:booking_date] && params[:set_booking_date]
			session[:booking_date] = params[:booking_date]
		end
		if params[:booking_interval]
			session[:booking_interval] = params[:booking_interval]['week'].to_i
		end
		redirect_to bookings_path
	end

end
