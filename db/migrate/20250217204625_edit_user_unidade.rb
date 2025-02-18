class EditUserUnidade < ActiveRecord::Migration[8.0]
  def change
    change_column_null :unidades, :usuario_id, true  # Permite NULL
  end
end
