# GEM repo source URL, use http if you have SSL certification problems (known bug)
source 'https://rubygems.org'

# Using Ruby 2.0, because the latest version has some issues with the needed gems
ruby '2.0.0'

# Needed to specify the exact Arel version because of a known DB issue
gem 'arel',                     '6.0.0.beta2'

# Latest Rails version
gem 'rails',                    '4.2.0.beta2'

# UID gems
gem 'bootstrap-sass',           '3.2.0.2'
gem 'sass',                     '3.4.7'
gem 'sass-rails',               '5.0.0.beta1'

# HAML gems, replacing the default eRB templating
gem 'haml',                     '4.0.5'
gem 'haml-rails',               '0.5.3'
gem 'haml-contrib',             '1.0.0.1'

# Javascript related gems
gem 'uglifier',                 '2.5.3'
gem 'jquery-rails',             '4.0.0.beta2'

# Rails helpers
gem 'turbolinks',               '2.3.0'
gem 'jbuilder',                 '2.1.3'
gem 'rails-html-sanitizer',     '1.0.1'

# Utility gems
gem 'sdoc',                     '0.4.0',  group: :doc
gem 'bcrypt',                   '3.1.7'
gem 'faker',                    '1.4.3'
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
	gem 'byebug',                 '3.4.0'
	gem 'web-console',            '2.0.0.beta4'
	gem 'spring',                 '1.1.3'
	gem 'thin',       					  '1.6.3'
	gem 'rails-dev-boost',        '0.3.0'
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


