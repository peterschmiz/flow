module BookingsHelper

	def get_assigned_division(project_id)
		division_ids = []
		assignes = ProjectAssignment.where(project_id: project_id)
		assignes.each do |assignment|
			user = User.where(id: assignment.user_id).where(activated: true).first
			if user
				division_id = user.division_id
				division_ids << division_id
			end
		end
		Division.where(id: division_ids).order(name: :asc)
	end

	def get_sum_booked_unit(project_id, division_id)
		@bookings = Booking.where(project_id: project_id)
		.where(user_id: User.where(division_id: division_id)
		.where(activated: true)
		.pluck(:id)).sum(:unit)
	end

	def get_booked_unit(project_id, user_id, date)
		Booking.where(project_id: project_id, user_id: user_id, date: date).pluck(:unit)
	end

	def get_assigned_division_users(project_id, division_id)
		user_ids = []
		assignes = ProjectAssignment.where(project_id: project_id)
		assignes.each do |assignment|
			user = User.where(id: assignment.user_id)[0]
			if user
				user_id = user.id
				user_ids << user_id
			end
		end
		User.where(id: user_ids, division_id: division_id).order(name: :asc)
	end

end
