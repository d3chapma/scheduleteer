class Job < ActiveRecord::Base
  has_and_belongs_to_many :volunteers
  belongs_to :event
end
