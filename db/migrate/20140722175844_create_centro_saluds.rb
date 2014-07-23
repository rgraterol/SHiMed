class CreateCentroSaluds < ActiveRecord::Migration
  def change
    create_table :centro_saluds do |t|
      t.string :email
      t.string :nombre
      t.string :rif
      t.text :descripcion
      t.string :estado
      t.string :ciudad
      t.text :direccion
      t.text :direccion_fiscal
      t.string :telefono
      t.string :fax
      t.string :sitio_web

      t.timestamps
    end
  end
end
