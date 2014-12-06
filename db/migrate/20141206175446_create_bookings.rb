class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.integer :unit
      t.date :date
      t.text :comment

      t.timestamps null: false
    end
  end
end
