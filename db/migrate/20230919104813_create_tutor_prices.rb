class CreateTutorPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_prices do |t|
      t.references :tutor, null: false, foreign_key: true
      t.integer :group_1
      t.integer :group_2
      t.integer :group_3
      t.integer :group_4_more
      t.integer :group_1_plus
      t.integer :group_2_plus
      t.integer :group_3_plus
      t.integer :group_4_more_plus

      t.timestamps
    end
  end
end
