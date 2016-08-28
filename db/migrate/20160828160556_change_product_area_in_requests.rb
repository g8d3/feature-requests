class ChangeProductAreaInRequests < ActiveRecord::Migration[5.0]
  def up
    remove_column :feature_requests, :product_area
    add_column :feature_requests, :product_area_id, :integer
  end

  def down
    remove_column :feature_requests, :product_area_id
    add_column :feature_requests, :product_area, :string
  end
end
