class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :category
      t.integer :horse_power
      t.integer :price_per_day
      t.string :transmision
      t.string :energy
      t.integer :year_circulation
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
