class Medico < ActiveRecord::Base
  belongs_to :usuario

  validates :usuario_id, presence: true, uniqueness: true
  validates :apellido, :cedula, :sexo, :cmv, :especialidad, presence: true

end
