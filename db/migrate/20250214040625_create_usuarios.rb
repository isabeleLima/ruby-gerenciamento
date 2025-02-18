class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :name
      t.integer :role

      t.timestamps
    end
  end
end
