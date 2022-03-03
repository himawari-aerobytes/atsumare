class CreateEventPartZones < ActiveRecord::Migration[6.1]
  def change
    create_table :event_part_zones do |t|
      t.references :event, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.references :zone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
