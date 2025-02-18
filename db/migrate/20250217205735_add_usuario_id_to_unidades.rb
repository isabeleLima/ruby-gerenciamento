class AddUsuarioIdToUnidades < ActiveRecord::Migration[8.0]
  def change
    add_reference :unidades, :usuario, null: true, foreign_key: true
  end
end
