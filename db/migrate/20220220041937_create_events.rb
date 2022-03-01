class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start
      t.datetime :end
      t.text :description
      t.boolean :isAllday

      t.timestamps
    end
  end
end
