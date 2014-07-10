class CreateCorals < ActiveRecord::Migration
  def change
    create_table :corals do |t|
      t.string :location
      t.string :exposure
      t.integer :image_id
      t.string :species
      t.string :growth_form
      t.decimal :distance
      t.text :notes

      t.timestamps
    end
  end
end
