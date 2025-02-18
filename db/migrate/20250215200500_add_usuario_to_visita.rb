class AddUsuarioToVisita < ActiveRecord::Migration[8.0]
  def change
    add_reference :visita, :usuario, null: false, foreign_key: true
  end
end
