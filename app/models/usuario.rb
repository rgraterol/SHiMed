#encoding: utf-8
class Usuario < ActiveRecord::Base
  has_many :medicos
  has_many :centro_saluds

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :nombre, format: {
      with: /(\A[a-zA-ZñÑáéíóúÁÉÍÓÚäëïöüÄËÏÖÜßÇç´][a-zA-ZñÑáéíóúÁÉÍÓÚßÇç´ -']+\Z)/, :message => 'El Nombre no puede contener números ni caracteres especiales'
  }
  validates :nombre, length: {in: 2..25, :message => "El Nombre no debe ser mayor a 25 caracteres" }
  validates :nombre, :presence => { :message => "El campo Nombre es obligatorio"}, on: :create

  validates :email, format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Inserte una direccion de correo valida'
  }
  validates :email, :presence => { :message => "El campo Email es obligatorio"}, :uniqueness => { :message => "Email ya existente"}, on: :create

  validates :password, format: {
      with: /\A^.*(?=.{4,10})(?=.*\d)(?=.*[a-zA-Z]).*\z/i, message: 'La contraseña debe de tener al menos una letra y un número y tener de 4 a 10 caracteres'
  }, on: :create, on: :create
  has_secure_password
  validates :password, :presence => { :message => "El campo Contraseña es obligatorio"}, on: :create

=begin
  validate :not_update_tipo_usuario

  def not_update_tipo_usuario
    if self.tipo_usuario!=nil
      errors.add(:tipo_usuario, "Ya tienes un Tipo de Usuario registrado")
    end
  end
=end

  def Usuario.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Usuario.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  #=============================================================
  #======================== PRIVATE ============================
  private
    def create_remember_token
      self.remember_token = Usuario.digest(Usuario.new_remember_token)
    end
end
