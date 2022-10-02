class ChangeCulummDistanceToPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :distance, :integer, default: 0, null: false
  end
end
