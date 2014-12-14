class CreateJobsVolunteers < ActiveRecord::Migration
  def change
    create_table :jobs_volunteers, id: false do |t|
      t.belongs_to :job
      t.belongs_to :volunteer
    end
  end
end
