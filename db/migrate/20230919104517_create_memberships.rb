class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :student, null: false, foreign_key: true
      t.boolean :plus
      t.date :starting_on
      t.date :expiring_on

      t.timestamps
    end
  end
end
