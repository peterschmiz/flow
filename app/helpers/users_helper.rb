module UsersHelper

	def divisions_for_select
		Division.all
	end

	def current_sort_dir
		params[:sort_dir]
	end

	def current_sort_by
		params[:sort_by]
	end

	def get_order_path(key)
		return '?sort_by=' + key + '&sort_dir=' + (params[:sort_dir] == 'asc' && params[:sort_by] == key ? 'desc' : 'asc')
	end

	def is_order_active?(key)
		if params[:sort_by] == key
			return true
		end
		return false
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
