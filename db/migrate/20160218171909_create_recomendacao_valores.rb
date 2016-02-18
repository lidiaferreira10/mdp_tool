class CreateRecomendacaoValores < ActiveRecord::Migration
  def change
    create_table :recomendacao_valores do |t|
      t.references :modelagem_privacidades, index: true
      t.references :valor_dimensoes, index: true

      t.timestamps null: false
    end
  end
end
