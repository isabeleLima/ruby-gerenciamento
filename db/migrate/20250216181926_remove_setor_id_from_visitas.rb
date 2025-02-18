class RemoveSetorIdFromVisitas < ActiveRecord::Migration[8.0]
  def change
    remove_reference :visita, :setor, null: false, foreign_key: true
  end
end
