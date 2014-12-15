class Day < ActiveRecord::Base
  belongs_to :schedule

  has_many :assignments
end
