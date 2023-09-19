class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.references :university, null: false, foreign_key: true
      t.integer :starting_year_univ
      t.string :course

      t.timestamps
    end
  end
end
