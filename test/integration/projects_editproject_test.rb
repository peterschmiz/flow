require 'test_helper'

class ProjectsEditProjectTest < ActionDispatch::IntegrationTest

	def setup
		@project = projects(:flowproject)
		@admin = users(:flowtest)
		log_in_as(@admin, remember_me: '0')
	end

	test 'unsuccessful edit' do
		get edit_project_path(@project)
		assert_template 'projects/edit'
		patch project_path(@project), project: {name: '', preview_deadline: {year: '2015', month: '1', day: '1'}, live_deadline: {year: '2015', month: '1', day: '1'}}
		assert_template 'projects/edit'
	end

end
