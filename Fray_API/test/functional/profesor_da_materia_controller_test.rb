require 'test_helper'

class ProfesorDaMateriaControllerTest < ActionController::TestCase
  setup do
    @profesor_da_materium = profesor_da_materia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesor_da_materia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesor_da_materium" do
    assert_difference('ProfesorDaMaterium.count') do
      post :create, :profesor_da_materium => @profesor_da_materium.attributes
    end

    assert_redirected_to profesor_da_materium_path(assigns(:profesor_da_materium))
  end

  test "should show profesor_da_materium" do
    get :show, :id => @profesor_da_materium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @profesor_da_materium.to_param
    assert_response :success
  end

  test "should update profesor_da_materium" do
    put :update, :id => @profesor_da_materium.to_param, :profesor_da_materium => @profesor_da_materium.attributes
    assert_redirected_to profesor_da_materium_path(assigns(:profesor_da_materium))
  end

  test "should destroy profesor_da_materium" do
    assert_difference('ProfesorDaMaterium.count', -1) do
      delete :destroy, :id => @profesor_da_materium.to_param
    end

    assert_redirected_to profesor_da_materia_path
  end
end
