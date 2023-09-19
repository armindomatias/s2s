class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.references :user, null: false, foreign_key: true
      t.text :about
      t.text :methodology

      t.timestamps
    end
  end
end
