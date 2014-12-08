module ProjectsHelper

	def users_for_select
		User.where(activated: true)
	end

	def project_owner_name(user_id)
		if user_id
			@user = User.find_by(id: user_id).name
		end
	end

	def users_assigned(project_id)
		@count = ProjectAssignment.where(project_id: project_id).count
	end

	def get_project_resource(project_id, division_id)
		@resource = ProjectResource.where(:division_id => division_id, :project_id => project_id).pluck(:unit)[0]
	end

	def get_percentage(total, actual)
		per = 0
		if total && actual
			if total > 0
				per = ((actual.to_f / total) * 100).to_i
			elsif actual > total
				per = 100
			else
				per = 0
			end

			if per > 100
				per = 100
			end
		end

		return per
	end

	def get_percentage_class(percentage)
		progress_class = 'progress-bar-info'
		if percentage > 80
			progress_class = 'progress-bar-success'
		elsif percentage < 60 && percentage > 40
			progress_class = 'progress-bar-warning'
		elsif percentage < 41
			progress_class = 'progress-bar-danger'
		end
		return progress_class
	end

end
