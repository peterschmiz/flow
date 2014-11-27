module ProjectAssignmentsHelper

	def users_for_select_by_id(project_id)
		User.find_by_sql('SELECT * FROM users WHERE activated = TRUE AND id NOT IN (SELECT user_id FROM project_assignments WHERE project_id = ' + project_id.to_s + ') ORDER BY name ASC')
	end

	def projects_for_select(project_id)
		Project.where :active => 1, :id => project_id
	end

end
