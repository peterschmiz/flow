class SearchController < ApplicationController
	before_action :logged_in_user

	def index
		@results = {}
		@count = 0
		query = params[:query]
		if query && query.length < 3
			flash[:warning] = 'The search query should be 3 characters long at least!'
			redirect_to search_url
		elsif query
			@results = get_search_results(query.downcase)
			@count = (@results['users'] ? @results['users'].count : 0) + (@results['projects'] ? @results['projects'].count : 0)
			@query = query
		end

	end

	private

	def get_search_results(query)
		queries = query.split(' ')
		results = {}
		users = []
		projects = []
		temp_results_users = []
		temp_results_projects = []
		queries.each { |subquery|
			temp_user = check_users(subquery)
			temp_project = check_projects(subquery)
			if temp_user.length > 0
				temp_results_users << temp_user
			end
			if temp_project.length > 0
				temp_results_projects << temp_project
			end
		}
		users.concat(temp_results_users).flatten.compact
		projects.concat(temp_results_projects).flatten.compact
		results['users'] = users[0]
		results['projects'] = projects[0]
		results
	end

	def check_users(query)
		User.where("lower(name) LIKE ? OR lower(email) LIKE ? OR lower(position) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%").all
	end

	def check_projects(query)
		Project.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(url) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%").all
	end

end
