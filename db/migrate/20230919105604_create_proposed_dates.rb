class CreateProposedDates < ActiveRecord::Migration[7.0]
  def change
    create_table :proposed_dates do |t|
      t.references :match, null: false, foreign_key: true
      t.date :proposed_date_1
      t.date :proposed_date_2
      t.date :proposed_date_3

      t.timestamps
    end
  end
end
