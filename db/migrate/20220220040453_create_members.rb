class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.references :grade
      t.references :schoolname
      t.string :address
      t.string :homephonenumber
      t.string :phonenumber
      t.references :group
      t.references :division
      t.references :zone

      t.timestamps
    end
  end
end
