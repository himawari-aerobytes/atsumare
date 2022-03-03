class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :location
      t.text :note
      t.references :owner, null: false, foreign_key: {to_table: :members}

      t.timestamps
    end
  end
end
