class CreateVisitantes < ActiveRecord::Migration[8.0]
  def change
    create_table :visitantes do |t|
      t.string :cpf
      t.string :name
      t.string :telephone
      t.string :picture

      t.timestamps
    end
  end
end
