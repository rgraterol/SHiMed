require 'test_helper'

class CentroSaludsControllerTest < ActionController::TestCase
  setup do
    @centro_salud = centro_saluds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centro_saluds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centro_salud" do
    assert_difference('CentroSalud.count') do
      post :create, centro_salud: { ciudad: @centro_salud.ciudad, descripcion: @centro_salud.descripcion, direccion: @centro_salud.direccion, direccion_fiscal: @centro_salud.direccion_fiscal, email: @centro_salud.email, estado: @centro_salud.estado, fax: @centro_salud.fax, nombre: @centro_salud.nombre, rif: @centro_salud.rif, sitio_web: @centro_salud.sitio_web, telefono: @centro_salud.telefono }
    end

    assert_redirected_to centro_salud_path(assigns(:centro_salud))
  end

  test "should show centro_salud" do
    get :show, id: @centro_salud
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @centro_salud
    assert_response :success
  end

  test "should update centro_salud" do
    patch :update, id: @centro_salud, centro_salud: { ciudad: @centro_salud.ciudad, descripcion: @centro_salud.descripcion, direccion: @centro_salud.direccion, direccion_fiscal: @centro_salud.direccion_fiscal, email: @centro_salud.email, estado: @centro_salud.estado, fax: @centro_salud.fax, nombre: @centro_salud.nombre, rif: @centro_salud.rif, sitio_web: @centro_salud.sitio_web, telefono: @centro_salud.telefono }
    assert_redirected_to centro_salud_path(assigns(:centro_salud))
  end

  test "should destroy centro_salud" do
    assert_difference('CentroSalud.count', -1) do
      delete :destroy, id: @centro_salud
    end

    assert_redirected_to centro_saluds_path
  end
end
