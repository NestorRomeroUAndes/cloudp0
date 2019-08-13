class UserEventRelation < ActiveRecord::Migration[5.2]
  def change
    change_table :eventos do |t|
      t.string :nombre
      t.string :categoria
      t.string :lugar
      t.string :direccion
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :modalidad

      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
