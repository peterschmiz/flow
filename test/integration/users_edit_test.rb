require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:flowtest)
		log_in_as(@user, remember_me: '0')
	end

	test 'unsuccessful edit' do
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), user: {name:                  '',
		                               email:                 'foo@invalid',
		                               password:              'foo',
		                               password_confirmation: 'bar',
		                               position:              'Developer'}
		assert_template 'users/edit'
	end

	test 'successful edit' do
		get edit_user_path(@user)
		assert_template 'users/edit'
		name  = 'Foo Bar'
		email = 'foo@bar.com'
		patch user_path(@user), user: {name:                  name,
		                               email:                 email,
		                               password:              '',
		                               password_confirmation: '',
		                               position:              'Developer'}
		assert_not flash.empty?
		assert_redirected_to users_path
		@user.reload
		assert_equal @user.name, name
		assert_equal @user.email, email
	end

	test 'successful edit with friendly forwarding' do
		delete logout_path
		get edit_user_path(@user)
		log_in_as(@user)
		assert_redirected_to edit_user_path(@user)
		name  = 'Foo Bar'
		email = 'foo@bar.com'
		patch user_path(@user), user: {name:                  name,
		                               email:                 email,
		                               password:              'foobar',
		                               password_confirmation: 'foobar',
		                               position:              'Developer'}
		assert_not flash.empty?
		assert_redirected_to users_path
		@user.reload
		assert_equal @user.name, name
		assert_equal @user.email, email
	end

end