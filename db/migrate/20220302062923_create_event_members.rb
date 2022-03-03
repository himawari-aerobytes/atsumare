class CreateEventMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_members do |t|
      t.references :member, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
