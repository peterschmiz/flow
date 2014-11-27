module ProjectAssignmentsHelper

	def users_for_select_by_id(project_id)
		User.where(activated: true).where.not(id: ProjectAssignment.select(:user_id).where(project_id: project_id)).order(name: :asc)
	end

	def projects_for_select(project_id)
		Project.where :active => 1, :id => project_id
	end

end
