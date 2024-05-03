class CreateResidences < ActiveRecord::Migration[7.1]
  def change
    create_table :residences do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price_per_night
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
