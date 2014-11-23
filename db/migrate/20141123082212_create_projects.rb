class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active, default: false
      t.string :description
      t.string :url
      t.date :preview_deadline
      t.date :live_deadline
      t.integer :owner_id

      t.timestamps null: false
    end
    add_index :projects, [:owner_id, :created_at]
  end
end
