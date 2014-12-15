class Assignment < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :day
  belongs_to :job

  scope :confirmed, -> { where(confirmed: true) }
end
