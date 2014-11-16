User.create!(name:                  'Flow Test',
             email:                 'flow@flow.com',
             password:              'flow123',
             password_confirmation: 'flow123')

60.times do |n|
	name     = Faker::Name.name
	email    = "flow-test-#{n+1}@flow.com"
	password = 'password'
	User.create!(name:                  name,
	             email:                 email,
	             password:              password,
	             password_confirmation: password)
end