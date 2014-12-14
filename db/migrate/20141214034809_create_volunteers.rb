class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.references :event, index: true

      t.timestamps
    end
  end
end
