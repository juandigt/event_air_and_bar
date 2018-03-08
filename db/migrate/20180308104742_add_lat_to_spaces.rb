class AddLatToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :lat, :float
  end
end
