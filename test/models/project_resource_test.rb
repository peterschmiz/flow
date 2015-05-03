require 'test_helper'

class ProjectResourceTest < ActiveSupport::TestCase

	def setup
		@project = projects(:flowproject)
		@division = divisions(:flowdivision1)
		@project_resource = ProjectResource.new(division_id: @division.id, project_id: @project.id, unit: 1)
	end

	test 'should be valid' do
		assert @project_resource.valid?
	end

	test 'division ID should be present' do
		@project_resource.division_id = nil
		assert_not @project_resource.valid?
	end

	test 'project ID should be present' do
		@project_resource.project_id = nil
		assert_not @project_resource.valid?
	end

	test 'unit should be present' do
		@project_resource.unit = nil
		assert_not @project_resource.valid?
	end

	test 'unit should be numeric' do
		@project_resource.unit = 'a'
		assert_not @project_resource.valid?
	end

end
