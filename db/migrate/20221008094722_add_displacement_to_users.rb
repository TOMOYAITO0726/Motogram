class AddDisplacementToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :displacement, :integer
  end
end
