class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :jobs, dependent: :destroy
  belongs_to :event
  has_many :assignments

  validates :name, uniqueness: true
end
