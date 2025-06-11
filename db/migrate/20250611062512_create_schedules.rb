class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :practitioner, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :schedule_type, null: false
      t.string :recurrence_rule
      t.date :recurrence_end_date
      t.string :comment
      t.timestamps
    end
  end
end