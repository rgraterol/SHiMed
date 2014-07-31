class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.text :direccion
      t.string :telefono_casa
      t.string :telefono_celular
      t.string :telefono_oficina
      t.integer :sexo
      t.date :fecha_nacimiento
      t.string :especialidad
      t.string :cmv
      t.text :cv
      t.string :url
      t.references :usuario, default: 0


      #Servicios Médicos
      t.string :centro_salud
      t.string :servicio_medico
      t.string :modalidad_consulta
      t.text :horario_consulta
      t.string :precio_consulta
      t.string :telefono_consultorio

      t.timestamps
    end
  end
end
