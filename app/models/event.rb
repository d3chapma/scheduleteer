class Event < ActiveRecord::Base
  has_many :volunteers
  has_many :jobs
  has_many :schedules

  def new_schedule(params)
    Event.transaction do
      schedule = schedules.create(params)
      # schedule.add_days
    end
  end
end
