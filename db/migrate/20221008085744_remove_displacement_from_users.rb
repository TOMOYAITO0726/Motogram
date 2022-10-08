class RemoveDisplacementFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :displacement, :string
  end
end
