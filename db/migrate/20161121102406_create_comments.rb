class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.timestamps
      t.string :message
      t.integer :user_id
      t.integer :listing_id
    end
  end
end
