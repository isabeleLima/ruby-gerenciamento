class AddSetorToVisitasAndModifyUsuario < ActiveRecord::Migration[8.0]
  def change
      # Adiciona a chave estrangeira setor_id
      add_reference :visita, :setor, foreign_key: true

      # Modifica a coluna usuario_id para permitir NULL
      change_column_null :visita, :usuario_id, true
  end
end
