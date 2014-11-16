require 'test_helper'

class UsersAdduserTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:flowtest)
		log_in_as(@user, remember_me: '0')
	end

	test 'invalid signup information' do
		get adduser_path
		assert_no_difference 'User.count' do
			post users_path, user: {name:                  '',
			                        email:                 'user@invalid',
			                        password:              'foo',
			                        password_confirmation: 'bar'}
		end
		assert_template 'users/new'
	end

	test 'valid signup information' do
		get adduser_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: {name:                  'Example User',
			                                     email:                 'user@example.com',
			                                     password:              'password',
			                                     password_confirmation: 'password'}
		end
		assert_template 'users/show'
	end

end
