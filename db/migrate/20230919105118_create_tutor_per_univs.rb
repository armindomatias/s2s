class CreateTutorPerUnivs < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_per_univs do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end
