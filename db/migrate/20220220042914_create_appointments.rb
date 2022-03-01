class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :event
      t.references :member

      t.timestamps
    end
  end
end
