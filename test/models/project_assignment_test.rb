require 'test_helper'

class ProjectAssignmentTest < ActiveSupport::TestCase
	def setup
		@user = users(:flowtest)
		@project = projects(:flowproject);
		@project_assignment = ProjectAssignment.new(user_id: @user.id, project_id: @project.id)
	end

	test 'should be valid' do
		assert @project_assignment.valid?
	end

	test 'user id should be present' do
		@project_assignment.user_id = nil
		assert_not @project_assignment.valid?
	end

	test 'project id should be present' do
		@project_assignment.project_id = nil
		assert_not @project_assignment.valid?
	end
end
