class CreateFeatureRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_requests do |t|
      t.string :title
      t.text :descrtiption
      t.belongs_to :client, foreign_key: true
      t.integer :client_priority
      t.date :target_date
      t.string :ticket_url
      t.string :product_area

      t.timestamps
    end
  end
end
