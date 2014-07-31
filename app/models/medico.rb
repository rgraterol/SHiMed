#encoding: utf-8
class Medico < ActiveRecord::Base
  belongs_to :usuario


  enum sexo: { Masculino: 0, Femenino: 1}
  validates :usuario_id, presence: true, :uniqueness => { :message => "Ya estas registrado como Médico"}

  validates :apellido, format: {
      with: /(\A[a-zA-ZñÑáéíóúÁÉÍÓÚäëïöüÄËÏÖÜßÇç´][a-zA-ZñÑáéíóúÁÉÍÓÚßÇç´ -']+\Z)/, :message => 'Apellido no puede contener números ni caracteres especiales'
  }
  validates :apellido, length: {in: 2..25, :message => "Apellido no debe ser mayor a 25 caracteres" }
  validates :apellido,  :presence => { :message => "El campo Apellido es obligatorio" }

  validates :cedula, format: {
      with: /(\A([VE\s]+)-[0-9]{1,15}\z)/i , :message => "Cédula debe ir con el formato V/E-XXXXXXX"
  }
  validates :cedula, :uniqueness => { :message => "Esa Cédula ya existente"}
  validates :cedula, :presence => { :message => "El campo Cedula es obligatorio" }

  validates :especialidad, format: {
      with: /(\A[a-zA-ZñÑáéíóúÁÉÍÓÚäëïöüÄËÏÖÜßÇç´][a-zA-ZñÑáéíóúÁÉÍÓÚßÇç´ -']+\Z)/, :message => 'Especialidad no puede contener números ni caracteres especiales'
  }
  validates :especialidad, :presence => { :message => "El campo Especialidad es obligatorio" }

  validates :telefono_casa, format: {
      with: /(\A^:(([0-9]{4,6})+-([0-9]{7,9}))\z)/i, :message => "Teléfono de Casa debe ir con el formato XXXX-XXXXXXX y solo puede contener números"
  }, :allow_blank => true

  validates :telefono_celular, format: {
      with: /(\A^([0-9]{4,6})+-([0-9]{7,9})\z)/i, :message => "Teléfono Celular debe ir con el formato XXXX-XXXXXXX y solo puede contener números"
  }, :allow_blank => true

  validates :telefono_oficina, format: {
      with: /(\A([0-9]{4,6})+-([0-9]{7,9})\z)/i, :message => "Teléfono Oficina debe ir con el formato XXXX-XXXXXXX y solo puede contener números"
  }, :allow_blank => true

  validates :telefono_consultorio, format: {
      with: /(\A([0-9]{4,6})+-([0-9]{7,9})\z)/i, :message => "Teléfono Consultorio debe ir con el formato XXXX-XXXXXXX y solo puede contener números"
  }, :allow_blank => true

  validates :sexo, :presence => { :message => "El campo Sexo es obligatorio" }

  validates :cmv, format: {
      with: /(\A^[0-9]{4,10}\z)/i, :message => 'El número de colegio de Médicos no puede contener letras ni caracteres especiales y debe contener una longitud de 4 a 10 caracteres'
  }
  validates :cmv, :presence => { :message => "El campo CMV es obligatorio" }




end
