require 'test_helper'

class SearchControllerTest < ActionController::TestCase

	def setup
		@user = users(:flowtest)
		@project = projects(:flowproject)
	end

	test 'should redirect index when not logged in' do
		get :index
		assert_redirected_to login_url
	end

	test 'should show warning message if query is too short' do
		log_in_as(@user, remember_me: '0')
		get :index, query: 't'
		assert_not flash.empty?
		assert_redirected_to search_url
	end

end
