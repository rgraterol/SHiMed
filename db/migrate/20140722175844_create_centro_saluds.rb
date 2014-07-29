class CreateCentroSaluds < ActiveRecord::Migration
  def change
    create_table :centro_saluds do |t|
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
      t.references :usuario, default:0

      t.timestamps
    end
  end
end
