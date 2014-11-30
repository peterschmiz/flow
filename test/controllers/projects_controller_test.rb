require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

	def setup
		@user    = users(:flowtest)
		@project = projects(:flowproject)
	end

	test 'should redirect index when not logged in' do
		get :index
		assert_redirected_to login_url
	end

	test 'should get new' do
		log_in_as(@user, remember_me: '0')
		get :new
		assert_response :success
	end

	test 'should redirect edit when not logged in' do
		get :edit, id: @user
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test 'should redirect update when not logged in' do
		patch :update, id: @project, project: {name: @project.name}
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test 'should redirect destroy when not logged in' do
		assert_no_difference 'Project.count' do
			delete :destroy, id: @project
		end
		assert_redirected_to login_url
	end

end
