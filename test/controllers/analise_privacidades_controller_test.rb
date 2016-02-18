require 'test_helper'

class AnalisePrivacidadesControllerTest < ActionController::TestCase
  setup do
    @analise_privacidade = analise_privacidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analise_privacidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analise_privacidade" do
    assert_difference('AnalisePrivacidade.count') do
      post :create, analise_privacidade: { descricao_analise: @analise_privacidade.descricao_analise, rede_social: @analise_privacidade.rede_social, url_rede_social: @analise_privacidade.url_rede_social }
    end

    assert_redirected_to analise_privacidade_path(assigns(:analise_privacidade))
  end

  test "should show analise_privacidade" do
    get :show, id: @analise_privacidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @analise_privacidade
    assert_response :success
  end

  test "should update analise_privacidade" do
    patch :update, id: @analise_privacidade, analise_privacidade: { descricao_analise: @analise_privacidade.descricao_analise, rede_social: @analise_privacidade.rede_social, url_rede_social: @analise_privacidade.url_rede_social }
    assert_redirected_to analise_privacidade_path(assigns(:analise_privacidade))
  end

  test "should destroy analise_privacidade" do
    assert_difference('AnalisePrivacidade.count', -1) do
      delete :destroy, id: @analise_privacidade
    end

    assert_redirected_to analise_privacidades_path
  end
end
