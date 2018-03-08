class AddLngToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :lng, :float
  end
end
