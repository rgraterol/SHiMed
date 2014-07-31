#encoding: utf-8
module UsuariosHelper

  def not_update_tipo_usuario
    if @usuario.tipo_usuario == 1
      @usuario.errors.add("Médico", "Ya estas registrado como Médico, no te puedes volver a registrar.")
      return false
    else
      if @usuario.tipo_usuario == 2
        @usuario.errors.add("Centro de Salud", "Ya estas registrado como Centro de Salud, no te puedes volver a registrar.")
        return false
      else
        return true
      end
    end
  end
end
