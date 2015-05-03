require 'test_helper'

class ProjectAssignmentsControllerTest < ActionController::TestCase

	def setup
		@user = users(:flowtest)
		@project = projects(:flowproject)
	end

	test 'should redirect index when not logged in' do
		get :index
		assert_redirected_to login_url
	end

end
