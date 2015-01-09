module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = 'Flow'
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	# Returns the active project number
	def active_projects
		Project.where(active: true).count;
	end

	# Returns the active user number
	def active_users
		User.where(activated: true).count;
	end

	# Returns the number of divisions
	def division_count
		Division.count;
	end

end
