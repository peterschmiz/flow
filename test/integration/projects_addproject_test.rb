require 'test_helper'

class ProjectsAddProjectTest < ActionDispatch::IntegrationTest

	def setup
		@admin = users(:flowtest)
		log_in_as(@admin, remember_me: '0')
	end

	test 'invalid project information' do
		get addproject_path
		assert_no_difference 'Project.count' do
			post projects_path, project: {name: '', preview_deadline: {year: '2015', month: '1', day: '1'}, live_deadline: {year: '2015', month: '1', day: '1'}}
		end
		assert_template 'projects/new'
		assert_select 'div.field_with_errors'
	end

	test 'valid project information' do
		get addproject_path
		assert_difference 'Project.count', 1 do
			post projects_path, project: {name: 'Teszt projekt', preview_deadline: {year: '2015', month: '1', day: '1'}, live_deadline: {year: '2015', month: '1', day: '1'}}
		end
	end

end
