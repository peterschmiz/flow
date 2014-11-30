class Project < ActiveRecord::Base
	has_many :project_assignments
	has_many :users, through: :project_assignments, dependent: :restrict_with_exception

	default_scope -> { order(active: :desc, name: :asc) }

	validates :name, presence: true
end
