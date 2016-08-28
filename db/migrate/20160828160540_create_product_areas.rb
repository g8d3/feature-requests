class CreateProductAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :product_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
