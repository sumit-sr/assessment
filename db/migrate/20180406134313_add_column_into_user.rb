class AddColumnIntoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :faculty_id, :integer
  end
end
