class Schedule < ActiveRecord::Base
  belongs_to :event
  has_many :days, dependent: :destroy
  has_many :assignments, through: :days
  has_many :jobs, through: :event
  has_many :volunteers, through: :event

  def add_days
    dates = (start_on..end_on).select { |day| day.wday == 0 }
    dates.each do |date|
      days.create(date: date)
    end
  end

  def add_assignments
    days.each do |day|
      event.jobs.each do |job|
        job.volunteers.each do |volunteer|
          Assignment.create(day: day, job: job, volunteer: volunteer)
        end
      end
    end
  end
end
