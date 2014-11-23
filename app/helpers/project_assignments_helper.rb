module ProjectAssignmentsHelper

	def users_for_select
		User.where :activated => 1
	end

	def projects_for_select(project_id)
		Project.where :active => 1, :id => project_id
	end

end
