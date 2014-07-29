module UsuariosHelper
=begin
  def sign_in(user)
    remember_token = Usuario.new_remember_token
    user.update_attribute(:remember_token, Usuario.digest(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = Usuarior.digest(cookies[:remember_token])
    @current_user ||= Usuarior.find_by(remember_token: remember_token)
  end
=end

end
