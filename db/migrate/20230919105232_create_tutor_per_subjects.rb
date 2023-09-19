class CreateTutorPerSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_per_subjects do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
