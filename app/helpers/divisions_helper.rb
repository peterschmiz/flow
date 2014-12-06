module DivisionsHelper

	def users_by_division(division_id)
		@count = User.where(division_id: division_id).count
	end

end
