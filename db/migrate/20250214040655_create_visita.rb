class CreateVisita < ActiveRecord::Migration[8.0]
  def change
    create_table :visita do |t|
      t.references :visitante, null: false, foreign_key: true
      t.references :setor, null: false, foreign_key: true
      t.datetime :date
      t.integer :status

      t.timestamps
    end
  end
end
