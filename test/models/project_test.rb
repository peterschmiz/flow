require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

	def setup
		@user = users(:flowtest)
		@project = @user.projects.build(name: 'Sample project', owner_id: @user.id)
	end

	test 'should be valid' do
		assert @project.valid?
	end

	test 'name should be present' do
		@project.name = '  '
		assert_not @project.valid?
	end

	test 'order should be most recent first' do
		assert_equal Project.first, projects(:flowproject)
	end

end
