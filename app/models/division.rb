class Division < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	default_scope -> { order(name: :asc) }

	validates :name, presence: true
end
