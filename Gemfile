# GEM repo source URL, use http if you have SSL certification problems (known bug)
source 'https://rubygems.org'

# Using Ruby 2.0, because the latest version has some issues with the needed gems
ruby '2.0.0'

# Needed to specify the exact Arel version because of a known DB issue
gem 'arel',                     '6.0.0.beta2'

# Latest Rails version at the time of development
gem 'rails',                    '4.2.0.beta2'

# UID related gems
# Sass version of Boostrap, used for default styling
gem 'bootstrap-sass',           '3.2.0.2'

# Sass pre-processor & the Rails adapter
gem 'sass',                     '3.4.7'
gem 'sass-rails',               '5.0.0.beta1'

# HAML gems, replacing the default eRB templating
gem 'haml',                     '4.0.5'
gem 'haml-rails',               '0.5.3'
# Different HAML extensions
gem 'haml-contrib',             '1.0.0.1'

# Javascript related gems
# Uglifier gem for minifications of Javascript files
gem 'uglifier',                 '2.5.3'
# Jquery Rails connector
gem 'jquery-rails',             '4.0.0.beta2'

# Rails helpers
gem 'turbolinks',               '2.3.0'
# JSON helper & builder
gem 'jbuilder',                 '2.1.3'
gem 'rails-html-sanitizer',     '1.0.1'

# Utility gems
# RDoc document generator
gem 'sdoc',                     '0.4.0',  group: :doc
gem 'bcrypt',                   '3.1.7'
# Gem for faking data, useful when generating test datas
gem 'faker',                    '1.4.3'
# Gem for paginating lists or views
gem 'will_paginate',            '3.0.7'
gem 'bootstrap-will_paginate',  '0.0.10'

# Database related gems
# We use PostgreSQL also in development mode instead of the
# default SQLite
gem 'pg',                       '0.17.1'

# Needed because of the Windows environment (in which I'm developing)
gem 'tzinfo-data',              platforms: [:mingw, :mswin, :x64_mingw]

# Gems only needed during the development
group :development, :test do
	# Gem for easier debugging
	gem 'byebug',                 '3.4.0'
	# Debug helper, web-based
	gem 'web-console',            '2.0.0.beta4'
	# Application pre-loader, helps to speed up developing
	gem 'spring',                 '1.1.3'
	# Faster web-server for Windows
	gem 'thin',       					  '1.6.3'
	gem 'rails-dev-boost',        '0.3.0'
	# Windows Directory Monitoring, watches for file changes
	gem 'wdm',                    '0.1.0',  :platforms => [:mswin, :mingw]
end

# Gems only needed for testing
group :test do
	gem 'minitest-reporters',     '1.0.5'
	gem 'mini_backtrace',         '0.1.3'
	gem 'guard-minitest',         '2.3.1'
end

# Gems only needed for production
# Unicorn is needed because of Heroku
group :production do
	gem 'rails_12factor',         '0.0.2'
	gem 'unicorn',                '4.8.3'
end


