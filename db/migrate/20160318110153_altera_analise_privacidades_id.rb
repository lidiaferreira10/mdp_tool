class AlteraAnalisePrivacidadesId < ActiveRecord::Migration
  def change
    rename_column :tipo_comunicacoes, :analise_privacidades_id, :analise_privacidade_id
  end
end
