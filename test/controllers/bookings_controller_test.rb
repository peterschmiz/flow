require 'test_helper'

class BookingsControllerTest < ActionController::TestCase

	def setup
		@user = users(:flowtest)
		@project = projects(:flowproject)
	end

	test 'should redirect index when not logged in' do
		get :index
		assert_redirected_to login_url
	end

	test 'should get index' do
		log_in_as(@user, remember_me: '0')
		get :index
		assert_response :success
	end

end
