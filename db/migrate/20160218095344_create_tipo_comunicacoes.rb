class CreateTipoComunicacoes < ActiveRecord::Migration
  def change
    create_table :tipo_comunicacoes do |t|
      t.references :analise_privacidades, index: true
      t.string :tipo_comunicacao
      t.text :observacao, null: true

      t.timestamps null: false
    end
  end
end
