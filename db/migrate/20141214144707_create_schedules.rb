class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :start_on
      t.date :end_on
      t.references :event, index: true

      t.timestamps
    end
  end
end
