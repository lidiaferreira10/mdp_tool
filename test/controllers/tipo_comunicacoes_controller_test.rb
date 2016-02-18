require 'test_helper'

class TipoComunicacoesControllerTest < ActionController::TestCase
  setup do
    @tipo_comunicacao = tipo_comunicacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_comunicacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_comunicacao" do
    assert_difference('TipoComunicacao.count') do
      post :create, tipo_comunicacao: { Analise_Privacidade_id: @tipo_comunicacao.Analise_Privacidade_id, observacao: @tipo_comunicacao.observacao, tipo_comunicacao: @tipo_comunicacao.tipo_comunicacao }
    end

    assert_redirected_to tipo_comunicacao_path(assigns(:tipo_comunicacao))
  end

  test "should show tipo_comunicacao" do
    get :show, id: @tipo_comunicacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_comunicacao
    assert_response :success
  end

  test "should update tipo_comunicacao" do
    patch :update, id: @tipo_comunicacao, tipo_comunicacao: { Analise_Privacidade_id: @tipo_comunicacao.Analise_Privacidade_id, observacao: @tipo_comunicacao.observacao, tipo_comunicacao: @tipo_comunicacao.tipo_comunicacao }
    assert_redirected_to tipo_comunicacao_path(assigns(:tipo_comunicacao))
  end

  test "should destroy tipo_comunicacao" do
    assert_difference('TipoComunicacao.count', -1) do
      delete :destroy, id: @tipo_comunicacao
    end

    assert_redirected_to tipo_comunicacoes_path
  end
end
