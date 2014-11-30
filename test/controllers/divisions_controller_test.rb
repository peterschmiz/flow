require 'test_helper'

class DivisionsControllerTest < ActionController::TestCase

	def setup
		@user    = users(:flowtest)
		@division = divisions(:flowdivision1)
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
		get :edit, id: @division
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test 'should redirect update when not logged in' do
		patch :update, id: @division, division: {name: @division.name}
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test 'should redirect destroy when not logged in' do
		assert_no_difference 'Division.count' do
			delete :destroy, id: @division
		end
		assert_redirected_to login_url
	end

end
