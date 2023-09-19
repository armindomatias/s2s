class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :student, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.boolean :accepted
      t.string :student_objective
      t.date :first_session_on

      t.timestamps
    end
  end
end
