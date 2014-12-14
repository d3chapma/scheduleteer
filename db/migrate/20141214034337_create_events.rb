class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :event

      t.timestamps
    end
  end
end
