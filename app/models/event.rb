class Event < ActiveRecord::Base
  has_many :volunteers, dependent: :destroy
  has_many :jobs,       dependent: :destroy
  has_many :schedules,  dependent: :destroy

  def new_schedule(params)
    Event.transaction do
      schedule = schedules.create(params)
      schedule.add_days
      schedule
    end
  end
end
