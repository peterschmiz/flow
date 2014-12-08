class BookingsController < ApplicationController
	before_action :logged_in_user

	def index
		@booking_date = Date.today
		@booking_interval = 1
		@only_workdays = false
		if session[:booking_date]
			sdate = session[:booking_date]
			@booking_date = Date.new(sdate['year'].to_i, sdate['month'].to_i, sdate['day'].to_i)
		end
		if session[:booking_interval]
			@booking_interval = session[:booking_interval]
		end
		if session[:only_workdays]
			@only_workdays = true
		end
		@days = get_days(@booking_date, @booking_interval)
		@projects = get_projects
	end

	def setdate
		if params[:booking_date] && params[:set_booking_date]
			session[:booking_date] = params[:booking_date]
		end
		if params[:booking_interval]
			session[:booking_interval] = params[:booking_interval]['week'].to_i
		end
		if params[:only_workdays]
			session[:only_workdays] = true
		else
			session[:only_workdays] = false
		end
		redirect_to bookings_path
	end

	def update_bookings
		raw = []
		data = {}
		if params[:update_bookings]
			params.each do |param|
				raw = param[0].split('_')
				val = 0
				if raw && raw[0] === 'bk' && raw[1] != 'dis'
					data[:date] = raw[2]
					data[:project_id] = raw[4]
					data[:user_id] = raw[6]
					data[:unit] = param[1]
					if data[:unit] != ''
						if data[:unit].is_i?
							if data[:unit].to_i > 0
								save_booking(data)
							elsif data[:unit].to_i == 0
								delete_booking(data)
							end
						else
							flash[:warning] = 'Booking unit can be only number!'
						end
					end
				end
			end
		end
		redirect_to bookings_path
	end

	private

	def save_booking(data)
		if Booking.exists?(:user_id => data[:user_id], :project_id => data[:project_id], :date => data[:date])
			@booking = Booking.where(:user_id => data[:user_id], :project_id => data[:project_id], :date => data[:date]).first
		else
			@booking = Booking.new
		end

		@booking.user_id = data[:user_id]
		@booking.project_id = data[:project_id]
		@booking.date = data[:date]
		@booking.unit = data[:unit]

		if @booking.save
			flash[:success] = 'Booking updated!'
		else
			flash[:danger] = 'Booking update error!'
		end

	end

	def delete_booking(data)
		if Booking.exists?(:user_id => data[:user_id], :project_id => data[:project_id], :date => data[:date])
			@booking = Booking.where(:user_id => data[:user_id], :project_id => data[:project_id], :date => data[:date]).first
		else
			flash[:danger] = 'Booking does not exists! Can\'t be deleted!'
		end

		if @booking && @booking.destroy
			flash[:success] = 'Booking updated!'
		else
			flash[:danger] = 'Booking update error!'
		end

	end

	def get_projects
		Project.where(active: true).order(name: :asc)
	end

	def get_days(start, interval)
		end_date = start + (interval * 7) - 1
		every_day = (start..end_date).to_a
	end

end
