class DropUsuarioIdFromUnidades < ActiveRecord::Migration[8.0]
  def change
    remove_column :unidades, :usuario_id
  end
end
