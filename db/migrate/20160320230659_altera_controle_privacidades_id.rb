class AlteraControlePrivacidadesId < ActiveRecord::Migration
  def change
    rename_column :modelagem_privacidades, :controle_privacidades_id, :controle_privacidade_id
  end
end
