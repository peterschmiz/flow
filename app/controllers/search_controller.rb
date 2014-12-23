class SearchController < ApplicationController

	def index
		@results = {}
		@count = 0
		query = params[:query]
		if query && query.length < 3
			flash[:warning] = 'The search query should be 3 characters long at least!'
			redirect_to search_url
		elsif query
			@results = get_search_results(query.downcase)
			@count = @results['users'].count + @results['projects'].count
			@query = query
		end

	end

	private

	def get_search_results(query)
		results = {}
		results['users'] = check_users(query)
		results['projects'] = check_projects(query)
		return results
	end

	def check_users(query)
		User.where("lower(name) LIKE ? OR lower(email) LIKE ?", "%#{query}%", "%#{query}%").all
	end

	def check_projects(query)
		Project.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(url) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%").all
	end

end
