class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :email
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.text :direccion
      t.string :telefono_casa
      t.string :telefono_celular
      t.string :telefono_oficina
      t.string :sexo
      t.date :fecha_nacimiento
      t.string :especialidad
      t.string :cmv
      t.text :cv
      t.string :url

      t.timestamps
    end
  end
end
