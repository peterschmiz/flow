require 'test_helper'

class UsersAdduserTest < ActionDispatch::IntegrationTest

	def setup
		@admin = users(:flowtest)
		log_in_as(@admin, remember_me: '0')
	end

	test 'invalid signup information' do
		get adduser_path
		assert_no_difference 'User.count' do
			post users_path, user: {name:                  '',
			                        email:                 'user@invalid',
			                        password:              'foo',
			                        password_confirmation: 'bar',
			                        position:              'Developer'}
		end
		assert_template 'users/new'
		assert_select 'div.field_with_errors'
	end

	test 'valid signup information without activation' do
		get adduser_path
		assert_difference 'User.count', 1 do
			post users_path, user: {name:                  'Example User',
			                        email:                 'user@example.com',
			                        password:              'password',
			                        password_confirmation: 'password',
			                        position:              'Developer'}
		end
		user = assigns(:user)
		assert_not user.activated?
		log_in_as(user)
	end

end
