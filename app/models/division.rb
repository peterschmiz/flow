class Division < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	default_scope -> { order('name ASC') }

	validates :name, presence: true
end
