class MailConfirm < ActionMailer::Base
  default from: "pruebasJuan837@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_confirm.recibido.subject
  #
  def recibido(usuario)
    @usuario = usuario
    @host = 'http://localhost:3000/'
    mail(to: @usuario.email, subject: 'SHiMed-Confirma tu Correo')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_confirm.enviado.subject
  #
  def enviado
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
