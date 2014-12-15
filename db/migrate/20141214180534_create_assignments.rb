class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :score
      t.boolean :confirmed, default: false
      t.boolean :absent,    default: false
      t.references :volunteer, index: true
      t.references :day, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
