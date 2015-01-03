class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :jobs, dependent: :destroy
  belongs_to :event
  has_many :assignments

  validates :name, uniqueness: true

  def sorted_for(event)
    volunteers = where(event: event)
    volunteers.sort_by(&:sortable_name)
  end

  def sortable_name
    names = name.split(' ')
    last_name = names.pop
    sortable_names = [last_name] + names
    sortable_names.join(' ')
  end

  def display_name
    names = name.split(' ')
    last_initial = names.last[0]
    [names[0], last_initial].join(' ')
  end
end
