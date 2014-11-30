class Division < ActiveRecord::Base
	default_scope -> { order(name: :asc) }

	validates :name, presence: true
end
