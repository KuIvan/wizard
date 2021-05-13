class CreateWorkExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :work_experiences do |t|
      t.date :start_at
      t.date :end_at
      t.boolean :active, default: false
      t.string :organization_name
      t.timestamps
    end
  end
end
