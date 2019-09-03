class CreateProyectos < ActiveRecord::Migration[5.2]
  def change
    create_table :proyectos do |t|
      t.string, :nombre
      t.string, :descripcion
      t.bigint :valor

      t.timestamps
    end
  end
end
