class AddAssignmentsToDays < ActiveRecord::Migration
  def up
    Day.all.each do |day|
      day.schedule.event.volunteers.each do |volunteer|
        assignment = Assignment.where(day: day, volunteer: volunteer).first
        absent = assignment.try(:absent)
        Assignment.create(day: day, volunteer: volunteer, absent: absent)
      end
    end
  end

  def down
    Assignment.where(job: nil).delete_all
  end
end
