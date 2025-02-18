class AddNameToSetor < ActiveRecord::Migration[8.0]
  def change
    add_column :setors, :name, :string
  end
end
