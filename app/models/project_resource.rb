class ProjectResource < ActiveRecord::Base
	belongs_to :division
	belongs_to :project

	validates :division_id, uniqueness: {scope: :project_id}, presence: true
	validates :project_id, presence: true
	validates :unit, presence: true, numericality: { only_integer: true }
end
