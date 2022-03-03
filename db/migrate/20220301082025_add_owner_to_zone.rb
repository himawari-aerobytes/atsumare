class AddOwnerToZone < ActiveRecord::Migration[6.1]
  def change
    add_reference :zones, :owner, null: false, foreign_key: { to_table: :members}
  end
end
