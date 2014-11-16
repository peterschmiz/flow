require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	def setup
		@base_title = 'Flow'
		@user = users(:flowtest)
		log_in_as(@user, remember_me: '0')
	end

	test 'should get home' do
    get :home
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

end
