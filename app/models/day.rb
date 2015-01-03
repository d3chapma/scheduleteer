class Day < ActiveRecord::Base
  belongs_to :schedule

  has_many :assignments

  default_scope { order('date') }

  def formatted_date
    date.strftime('%b %d')
  end
end
