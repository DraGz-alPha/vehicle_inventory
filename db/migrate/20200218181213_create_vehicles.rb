class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :make
      t.string :model
      t.string :color
      t.string :transmission_type
      t.integer :year
      t.string :engine_size
      t.integer :kilometrage
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
