module ProjectsHelper

	def users_for_select
		User.where :activated => 1
	end

	def project_owner_name(user_id)
		if user_id
			@user = User.find_by(id: user_id).name
		end
	end

end
