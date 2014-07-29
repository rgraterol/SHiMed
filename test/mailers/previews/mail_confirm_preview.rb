# Preview all emails at http://localhost:3000/rails/mailers/mail_confirm
class MailConfirmPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_confirm/recibido
  def recibido
    MailConfirm.recibido
  end

  # Preview this email at http://localhost:3000/rails/mailers/mail_confirm/enviado
  def enviado
    MailConfirm.enviado
  end

end
