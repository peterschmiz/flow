User.create!(name:                  'Flow Admin',
             email:                 'flowadmin@flow.com',
             password:              'flow123',
             password_confirmation: 'flow123',
             position:              'Head of QA',
             admin:                 true,
             activated:             true)

User.create!(name:                  'Flow User',
             email:                 'flowuser@flow.com',
             password:              'flow123',
             password_confirmation: 'flow123',
             position:              'Developer',
             activated:             true)

User.create!(name:                  'Péter Schmíz',
             email:                 'peter.schmiz@carnationgroup.com',
             password:              'flow123',
             password_confirmation: 'flow123',
             position:              'Head of front-end',
             activated:             true)

60.times do |n|
	name     = Faker::Name.name
	email    = "flow-test-#{n+1}@flow.com"
	position = Faker::Name.title
	password = 'password'
	User.create!(name:                  name,
	             email:                 email,
	             password:              password,
	             password_confirmation: password,
	             position:              position,
	             activated:             false)
end

Project.create!(name:        'Carrefour Online',
                description: 'Carrefour Online E-commerce site, maintenance project',
                url:         'http://www.carrefour-online.ro',
                active:      true)

Project.create!(name:        'Telenor',
                description: 'Telenor site, maintenance project',
                url:         'http://www.telenor.hu',
                active:      true)

Project.create!(name:        'HSBC TimeHop',
                description: 'HSBC microsite with 360° videos, HTML5 solutions',
                active:      true)

60.times do |n|
	name             = Faker::App.name
	description      = Faker::Lorem.sentence(3)
	url              = Faker::Internet.domain_name
	preview_deadline = Faker::Date.backward(10)
	live_deadline    = Faker::Date.forward(30)
	Project.create!(name:             name,
	                description:      description,
	                url:              url,
	                preview_deadline: preview_deadline,
	                live_deadline:    live_deadline,
	                active:           false)
end

