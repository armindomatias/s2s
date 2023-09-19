class CreateSubjectPerUnivs < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_per_univs do |t|
      t.references :university, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
