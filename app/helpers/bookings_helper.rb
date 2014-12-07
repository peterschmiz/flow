module BookingsHelper

	def get_assigned_division(project_id)
		division_ids = []
		assignes = ProjectAssignment.where(project_id: project_id)
		assignes.each do |assignment|
			user = User.where(id: assignment.user_id)[0]
			division_id = user.division_id
			division_ids << division_id
		end
		Division.where(id: division_ids).order(name: :asc)
	end

	def get_assigned_division_users(project_id, division_id)
		user_ids = []
		assignes = ProjectAssignment.where(project_id: project_id)
		assignes.each do |assignment|
			user = User.where(id: assignment.user_id)[0]
			user_id = user.id
			user_ids << user_id
		end
		User.where(id: user_ids, division_id: division_id).order(name: :asc)
	end

end
