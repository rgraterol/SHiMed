#encoding: utf-8
class CentroSalud < ActiveRecord::Base
  belongs_to :usuario

  validates :usuario_id, presence: true, :uniqueness => { :message => "Ya estas registrado como Centro de Salud"}

  validates :rif, format: {
      with: /(\A([VE\s]+)-[0-9]{1,15}\z)/i , :message => "RIF debe tener el formato J/V/E-XXXXXXX"
  }
  validates :rif,  :presence => { :message => "El campo RIF es obligatorio" }

  validates :direccion, :presence => { :message => "El campo Direccion es obligatorio"}

  validates :direccion_fiscal, :presence => { :message => "El campo Direccion Fiscal es obligatorio"}

  validates :telefono, format: {
      with: /(\A^:(([0-9]{4,6})+-([0-9]{7,9}))\z)/i, :message => "Teléfono debe ir con el formato XXXX-XXXXXXX y solo puede contener números"
  }, :allow_blank => true

  validates :fax, format: {
      with: /(\A^:(([0-9]{4,6})+-([0-9]{7,9}))\z)/i, :message => "Fax debe ir con el formato XXXX-XXXXXXX y solo puede contener números"
  }, :allow_blank => true

end
