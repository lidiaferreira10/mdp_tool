class AlteraTipoComunicacoesId < ActiveRecord::Migration
  def change
    rename_column :modelagem_privacidades, :tipo_comunicacoes_id, :tipo_comunicacao_id
  end
end
