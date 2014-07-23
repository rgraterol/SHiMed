class CentroSalud < ActiveRecord::Base
  validates :email, :nombre, :rif, :direccion, :direccion_fiscal, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Inserte una direccion de correo valida'
  }

end
