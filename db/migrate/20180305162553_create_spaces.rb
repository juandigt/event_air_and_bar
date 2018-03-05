class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.text :description
      t.string :address
      t.integer :capacity
      t.float :price
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
