class Assignment < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :day
  belongs_to :job

  scope :confirmed, -> { where(confirmed: true) }

  delegate :sortable_name, to: :volunteer

  def update_absence(new_value)
    Assignment.where(volunteer_id: volunteer_id, day_id: day_id).update_all(absent: new_value)
  end

  def self.alphabetically(assignments=nil)
    self.sort do |item1, item2|
      names1 = item1.volunteer.name.split(' ')
      names2 = item2.volunteer.name.split(' ')

      value1 = names1.reverse.map(&:downcase).join(' ')
      value2 = names2.reverse.map(&:downcase).join(' ')

      value1 <=> value2
    end
  end
end
