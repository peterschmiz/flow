require 'test_helper'

class DivisionTest < ActiveSupport::TestCase

	def setup
		@division = Division.new(name: 'Example Division', description: 'Example Division for test')
	end

	test 'should be valid' do
		assert @division.valid?
	end

	test 'name should be present' do
		@division.name = '  '
		assert_not @division.valid?
	end

	test 'order should be based on name, ascending' do
		assert_equal Division.first, divisions(:flowdivision3)
	end

end
