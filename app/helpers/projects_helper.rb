module ProjectsHelper

	def users_for_select
		User.where(activated: true)
	end

	def project_owner_name(user_id)
		if user_id
			@user = User.find_by(id: user_id).name
		end
	end

	def get_project_resource(project_id, division_id)
		@resource = ProjectResource.where(:division_id => division_id, :project_id => project_id).pluck(:unit)[0]
	end

end
