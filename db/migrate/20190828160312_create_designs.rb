class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :Nombres
      t.string :Apellidos
      t.string :email
      #agregar el campo de archivo
      t.bigint :Precio

      t.timestamps
    end
  end
end
