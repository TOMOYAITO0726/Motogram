class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :caption, null: false
      t.integer :post_status, null: false, default: 0 
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
