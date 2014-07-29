class Usuario < ActiveRecord::Base
  has_many :medicos
  has_many :centro_saluds

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Inserte una direccion de correo valida'
  }
  has_secure_password

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
