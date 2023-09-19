class CreateTutorAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_availabilities do |t|
      t.references :tutor, null: false, foreign_key: true
      t.string :day_of_week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
