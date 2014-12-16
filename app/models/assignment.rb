class Assignment < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :day
  belongs_to :job

  scope :confirmed, -> { where(confirmed: true) }

  def update_absence(new_value)
    Assignment.where(volunteer_id: volunteer_id, day_id: day_id).update_all(absent: new_value)
  end
end
