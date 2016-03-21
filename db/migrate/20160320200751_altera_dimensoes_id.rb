class AlteraDimensoesId < ActiveRecord::Migration
  def change
    rename_column :modelagem_privacidades, :dimensoes_id, :dimensao_id
  end
end
