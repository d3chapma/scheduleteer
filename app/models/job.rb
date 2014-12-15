class Job < ActiveRecord::Base
  has_and_belongs_to_many :volunteers, dependent: :destroy
  belongs_to :event
  has_many :assignments
end
