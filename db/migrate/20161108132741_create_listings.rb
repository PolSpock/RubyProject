class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_admin, default: false
    end

    create_table :contacts do |t|

      t.timestamps
      t.string :message
      t.integer :user_id
      t.integer :listing_id
    end

    create_table :listings do |t|

      t.timestamps
      t.string :title
      t.string :description
      t.string :picture
      t.decimal :price
      t.integer :category_id
      t.integer :user_id
    end

    create_table :categories do |t|
      t.timestamps
      t.string :name

    end

  end
end
