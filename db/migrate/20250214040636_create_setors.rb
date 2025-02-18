class CreateSetors < ActiveRecord::Migration[8.0]
  def change
    create_table :setors do |t|
      t.references :unidade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
