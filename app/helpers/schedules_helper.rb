module SchedulesHelper
  def confirmed(assignments)
    assignments.select { |a| a.confirmed }
  end
end
