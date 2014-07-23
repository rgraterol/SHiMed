require 'test_helper'

class MedicosControllerTest < ActionController::TestCase
  setup do
    @medico = medicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medico" do
    assert_difference('Medico.count') do
      post :create, medico: { apellido: @medico.apellido, cedula: @medico.cedula, cmv: @medico.cmv, cv: @medico.cv, direccion: @medico.direccion, email: @medico.email, fecha_nacimiento: @medico.fecha_nacimiento, nombre: @medico.nombre, sexo: @medico.sexo, telefono_casa: @medico.telefono_casa, telefono_celular: @medico.telefono_celular, telefono_oficina: @medico.telefono_oficina, url: @medico.url }
    end

    assert_redirected_to medico_path(assigns(:medico))
  end

  test "should show medico" do
    get :show, id: @medico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medico
    assert_response :success
  end

  test "should update medico" do
    patch :update, id: @medico, medico: { apellido: @medico.apellido, cedula: @medico.cedula, cmv: @medico.cmv, cv: @medico.cv, direccion: @medico.direccion, email: @medico.email, fecha_nacimiento: @medico.fecha_nacimiento, nombre: @medico.nombre, sexo: @medico.sexo, telefono_casa: @medico.telefono_casa, telefono_celular: @medico.telefono_celular, telefono_oficina: @medico.telefono_oficina, url: @medico.url }
    assert_redirected_to medico_path(assigns(:medico))
  end

  test "should destroy medico" do
    assert_difference('Medico.count', -1) do
      delete :destroy, id: @medico
    end

    assert_redirected_to medicos_path
  end
end
