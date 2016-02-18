require 'test_helper'

class ModelagemPrivacidadesControllerTest < ActionController::TestCase
  setup do
    @modelagem_privacidade = modelagem_privacidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modelagem_privacidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modelagem_privacidade" do
    assert_difference('ModelagemPrivacidade.count') do
      post :create, modelagem_privacidade: { controle_privacidades_id: @modelagem_privacidade.controle_privacidades_id, dimensoes_id: @modelagem_privacidade.dimensoes_id, tipo_comunicacoes_id: @modelagem_privacidade.tipo_comunicacoes_id, valor_dimensoes_id: @modelagem_privacidade.valor_dimensoes_id }
    end

    assert_redirected_to modelagem_privacidade_path(assigns(:modelagem_privacidade))
  end

  test "should show modelagem_privacidade" do
    get :show, id: @modelagem_privacidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modelagem_privacidade
    assert_response :success
  end

  test "should update modelagem_privacidade" do
    patch :update, id: @modelagem_privacidade, modelagem_privacidade: { controle_privacidades_id: @modelagem_privacidade.controle_privacidades_id, dimensoes_id: @modelagem_privacidade.dimensoes_id, tipo_comunicacoes_id: @modelagem_privacidade.tipo_comunicacoes_id, valor_dimensoes_id: @modelagem_privacidade.valor_dimensoes_id }
    assert_redirected_to modelagem_privacidade_path(assigns(:modelagem_privacidade))
  end

  test "should destroy modelagem_privacidade" do
    assert_difference('ModelagemPrivacidade.count', -1) do
      delete :destroy, id: @modelagem_privacidade
    end

    assert_redirected_to modelagem_privacidades_path
  end
end
