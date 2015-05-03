require 'test_helper'

class BookingTest < ActiveSupport::TestCase

	def setup
		@user = users(:flowtest)
		@project = projects(:flowproject)
		@booking = Booking.new(user_id: @user.id, project_id: @project.id, unit: 1, date: '2015-01-01')
	end

	test 'should be valid' do
		assert @booking.valid?
	end

	test 'user ID should be present' do
		@booking.user_id = nil
		assert_not @booking.valid?
	end

	test 'project ID should be present' do
		@booking.project_id = nil
		assert_not @booking.valid?
	end

	test 'unit should be present' do
		@booking.unit = nil
		assert_not @booking.valid?
	end

	test 'unit should be numeric' do
		@booking.unit = 'a'
		assert_not @booking.valid?
	end

end
