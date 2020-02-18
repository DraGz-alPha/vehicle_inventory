class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :prefix
      t.int :age

      t.timestamps
    end
  end
end
