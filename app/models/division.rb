class Division < ActiveRecord::Base
	has_many :users, dependent: :restrict_with_exception

	default_scope -> { order(name: :asc) }

	validates :name, presence: true
end
