uid = Division.create!(name:        'UID',
                       description: 'User interface desinger & developer division')

gfx = Division.create!(name:        'GFX',
                       description: 'Creative & designer division')

dev = Division.create!(name:        'DEV',
                       description: 'Developer (.NET & PHP) division')

qa = Division.create!(name:        'QA',
                      description: 'Quality assurance division')

admin = User.create!(name:                  'Flow Admin',
                     email:                 'flowadmin@flow.com',
                     password:              'flow123',
                     password_confirmation: 'flow123',
                     position:              'Head of QA',
                     division_id:           qa.id,
                     admin:                 true,
                     activated:             true)

normal_user = User.create!(name:                  'Flow User',
                           email:                 'flowuser@flow.com',
                           password:              'flow123',
                           password_confirmation: 'flow123',
                           position:              'Developer',
                           division_id:           dev.id,
                           activated:             true)

peterschmiz = User.create!(name:                  'Péter Schmíz',
                           email:                 'peter.schmiz@carnationgroup.com',
                           password:              'flow123',
                           password_confirmation: 'flow123',
                           position:              'Head of front-end',
                           division_id:           uid.id,
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
                owner_id:    peterschmiz.id,
                active:      true)

Project.create!(name:        'Telenor',
                description: 'Telenor site, maintenance project',
                url:         'http://www.telenor.hu',
                owner_id:    normal_user.id,
                active:      true)

Project.create!(name:        'HSBC TimeHop',
                description: 'HSBC microsite with 360° videos, HTML5 solutions',
                owner_id:    normal_user.id,
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

