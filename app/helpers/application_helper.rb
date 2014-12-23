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

	def active_projects
		Project.where(active: true).count;
	end

	def active_users
		User.where(activated: true).count;
	end

	def division_count
		Division.count;
	end

end
