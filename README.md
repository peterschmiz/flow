# Flow

### An integrated project-resource management web application developed in Rails

[http://flow-app.heroku.com](http://flow-app.heroku.com)

## Installation steps

### Database related

1. make sure the role for the app is added (flow)
2. make sure the 'flow' role has all the needed privileges
3. run `rake db:create:all`

### Ruby related

1. make sure you have Ruby 2.0.0 installed
2. on OSX don't use sudo to install gems
3. install bundler gem globally and then install needed gems with bundle install

### Run tests

1. run `rake test` command

### Start local server

1. run `rails server` command
2. open your browser and type `localhost:3000`