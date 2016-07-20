require 'test_helper'

class Admin::SertificatesControllerTest < ActionController::TestCase
  setup do
    @admin_sertificate = admin_sertificates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sertificates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_sertificate" do
    assert_difference('Admin::Sertificate.count') do
      post :create, admin_sertificate: { image: @admin_sertificate.image, name: @admin_sertificate.name }
    end

    assert_redirected_to admin_sertificate_path(assigns(:admin_sertificate))
  end

  test "should show admin_sertificate" do
    get :show, id: @admin_sertificate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_sertificate
    assert_response :success
  end

  test "should update admin_sertificate" do
    patch :update, id: @admin_sertificate, admin_sertificate: { image: @admin_sertificate.image, name: @admin_sertificate.name }
    assert_redirected_to admin_sertificate_path(assigns(:admin_sertificate))
  end

  test "should destroy admin_sertificate" do
    assert_difference('Admin::Sertificate.count', -1) do
      delete :destroy, id: @admin_sertificate
    end

    assert_redirected_to admin_sertificates_path
  end
end
