require 'test_helper'

class GradeWeightsControllerTest < ActionController::TestCase
  setup do
    @grade_weight = grade_weights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grade_weights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grade_weight" do
    assert_difference('GradeWeight.count') do
      post :create, :grade_weight => @grade_weight.attributes
    end

    assert_redirected_to grade_weight_path(assigns(:grade_weight))
  end

  test "should show grade_weight" do
    get :show, :id => @grade_weight.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @grade_weight.to_param
    assert_response :success
  end

  test "should update grade_weight" do
    put :update, :id => @grade_weight.to_param, :grade_weight => @grade_weight.attributes
    assert_redirected_to grade_weight_path(assigns(:grade_weight))
  end

  test "should destroy grade_weight" do
    assert_difference('GradeWeight.count', -1) do
      delete :destroy, :id => @grade_weight.to_param
    end

    assert_redirected_to grade_weights_path
  end
end
