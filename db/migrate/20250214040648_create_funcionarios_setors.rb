class CreateFuncionariosSetors < ActiveRecord::Migration[8.0]
  def change
    create_table :funcionarios_setors do |t|
      t.references :setor, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
