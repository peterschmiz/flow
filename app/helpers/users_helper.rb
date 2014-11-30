module UsersHelper

	def divisions_for_select
		Division.all
	end

	def division_name(division_id)
		@name = 'No division associated with the user!'
		if division_id
			division = Division.find_by_id(division_id)
			if division
				@name = division.name
			end
		end
		return @name
	end

end
