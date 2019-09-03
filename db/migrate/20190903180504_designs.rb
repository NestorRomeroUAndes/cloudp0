class Designs < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :Nombres
      t.string :Apellidos
      t.string :Email
      t.string :Imagen
      t.bigint :Precio
      t.string :Estado

      t.belongs_to :proyecto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
