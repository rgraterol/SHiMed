module SessionsHelper
  def sign_in(usuario)
    remember_token=Usuario.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    usuario.update_attribute(:remember_token, Usuario.digest(remember_token))
    self.current_usuario=usuario
  end

  def current_usuario=(usuario)
    @current_usuario=usuario
  end

  def current_usuario
    remember_token = Usuario.digest(cookies[:remember_token])
    @current_usuario ||= Usuario.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_usuario.nil?
  end

  def sign_out
    current_usuario.update_attribute(:remember_token, Usuario.digest(Usuario.new_remember_token))
    cookies.delete(:remember_token)
    self.current_usuario = nil
  end

  def signin_by_id(asd)
    usuario_id = Usuario.find_by(params[:id])
    remember_token=Usuario.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    usuario_id.update_attribute(:remember_token, Usuario.digest(remember_token))
    asd = usuario_id
    self.current_usuario=usuario_id
  end
end
