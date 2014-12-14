class Schedule < ActiveRecord::Base
  belongs_to :event
  has_many :days, dependent: :destroy

  def add_days
    dates = (start_on..end_on).select { |day| day.wday == 0 }
    dates.each do |date|
      days.create(date: date)
    end
  end
end
