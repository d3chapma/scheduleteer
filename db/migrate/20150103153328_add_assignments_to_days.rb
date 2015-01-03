class AddAssignmentsToDays < ActiveRecord::Migration
  def up
    Day.all.each do |day|
      day.schedule.event.volunteers.each do |volunteer|
        Assignment.create(day: day, volunteer: volunteer)
      end
    end
  end

  def down
    Assignment.where(job: nil).delete_all
  end
end
