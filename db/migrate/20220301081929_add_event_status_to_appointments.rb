class AddEventStatusToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :status, null: false, foreign_key: true
  end
end
