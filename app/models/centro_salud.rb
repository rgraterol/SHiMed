class CentroSalud < ActiveRecord::Base
  belongs_to :usuario
  validates :rif, :direccion, :direccion_fiscal, presence: true
  validates :usuario_id, presence: true, uniqueness: true
end
