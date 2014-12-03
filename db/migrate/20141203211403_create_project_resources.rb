class CreateProjectResources < ActiveRecord::Migration
  def change
    create_table :project_resources do |t|
      t.integer :unit
      t.references :division, index: true
      t.references :project, index: true

      t.timestamps null: false
    end
  end
end
