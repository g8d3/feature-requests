class FixDescriptionTypo < ActiveRecord::Migration[5.0]
  def change
    rename_column :feature_requests, :descrtiption, :description
  end
end
