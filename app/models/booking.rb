class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, uniqueness: {:scope => [:project_id, :date]}, presence: true
  validates :project_id, presence: true
  validates :unit, presence: true, numericality: { only_integer: true }
  validates :date, presence: true

end
