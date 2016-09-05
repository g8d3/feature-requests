class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.belongs_to :commentable, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
