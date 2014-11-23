class Project < ActiveRecord::Base
	has_many :project_assignments
	has_many :users, through: :project_assignments

	default_scope -> { order('created_at DESC') }

	validates :name, presence: true
end
