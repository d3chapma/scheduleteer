class Event < ActiveRecord::Base
  has_many :volunteers, dependent: :destroy do

    def alphabetically
      self.sort do |item1, item2|
        name1 = item1.sortable_name
        name2 = item2.sortable_name

        name1 <=> name2
      end
    end
  end

  has_many :jobs,       dependent: :destroy
  has_many :schedules,  dependent: :destroy

  def new_schedule(params)
    Event.transaction do
      schedule = schedules.create(params)
      schedule.add_days
      schedule.add_assignments
      schedule
    end
  end
end
