class CreateProjectAssignments < ActiveRecord::Migration
  def change
    create_table :project_assignments do |t|
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps null: false
    end
  end
end
