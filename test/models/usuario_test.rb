require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  test "Nombre" do
    #Este test chequea las validaciones de modelo de nombre
    assert_not_empty @usuario.nombre
    assert_equal "Adriana", @usuario.nombre
    #La proxima assertion revisara si se levanta una excepcion cuando se ingresa un NOMBRE VACIO
    assert_raise ActiveRecord::RecordInvalid do
      Usuario.create!(
          nombre: "",
          email: "adriana@gmail.com",
          password_digest: "asd123",
          tipo_usuario: 1,

      )
    end
    #La proxima assertion revisara si se levanta una excepcion cuando el nombre es MUY LARGO
    assert_raise ActiveRecord::RecordInvalid do
      Usuario.create!(
          nombre: "Adriana Adriana Adriana Adriana Adriana Adriana Adriana Adriana Adriana Adriana",
          email: "adriana@gmail.com",
          password_digest: "asd123"
      )
    end
  end
end
